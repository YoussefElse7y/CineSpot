import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_details_entity.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvShowHeader extends StatelessWidget {
  final TvShowDetailsEntity tvShow;

  const TvShowHeader({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    final l10n = AppLocalizations.of(context)!;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Backdrop Image
        if (tvShow.backdropPath != null)
          CachedNetworkImage(
            imageUrl: TMDBImageHelper.getBackdrop(
              tvShow.backdropPath!,
              BackdropSize.w1280,
            ),
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Container(color: isDark ? Colors.grey[850] : Colors.grey[300]),
            errorWidget: (context, url, error) => Container(
              color: isDark ? Colors.grey[850] : Colors.grey[300],
              child: const Icon(Icons.tv, size: 80),
            ),
          ),

        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.9),
              ],
              stops: const [0.0, 0.7, 1.0],
            ),
          ),
        ),

        // Content
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rating Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE21221),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      tvShow.voteAverage.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Title
              Text(
                tvShow.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // Genres
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tvShow.genres.take(3).map((genre) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Text(
                      genre.name,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Action Buttons
              Row(
                children: [
                  // Play Button
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: Text(l10n.play),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE21221),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Wishlist Button
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      final isInWishlist = state.maybeWhen(
                        loaded: (profile) =>
                            (profile.wishlistTvIds ?? []).contains(tvShow.id),
                        orElse: () => false,
                      );

                      return _ActionButton(
                        icon: isInWishlist
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        onTap: () {
                          if (isInWishlist) {
                            context.read<ProfileBloc>().add(
                              ProfileEvent.removeWishlistTvShow(
                                userId,
                                tvShow.id,
                              ),
                            );
                          } else {
                            context.read<ProfileBloc>().add(
                              ProfileEvent.addWishlistTvShow(userId, tvShow.id),
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 12),

                  // Favorite Button
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      final isFavorite = state.maybeWhen(
                        loaded: (profile) =>
                            (profile.favoriteTvIds ?? []).contains(tvShow.id),
                        orElse: () => false,
                      );

                      return _ActionButton(
                        icon: isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        onTap: () {
                          if (isFavorite) {
                            context.read<ProfileBloc>().add(
                              ProfileEvent.removeFavoriteTvShow(
                                userId,
                                tvShow.id,
                              ),
                            );
                          } else {
                            context.read<ProfileBloc>().add(
                              ProfileEvent.addFavoriteTvShow(userId, tvShow.id),
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 12),

                  // Share Button
                  _ActionButton(icon: Icons.share, onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
