import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodeCastSection extends StatelessWidget {
  const EpisodeCastSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<TvShowBloc, TvShowState>(
      buildWhen: (previous, current) =>
          previous.episodeCreditsStatus != current.episodeCreditsStatus,
      builder: (context, state) {
        if (state.episodeCreditsStatus == EpisodeCreditsStatus.loading) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.episodeCreditsStatus == EpisodeCreditsStatus.error) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Failed to load cast',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          );
        }

        if (state.episodeCreditsStatus == EpisodeCreditsStatus.loaded &&
            state.episodeCredits != null) {
          final credits = state.episodeCredits!;
          final hasGuestStars = credits.guestStars.isNotEmpty;
          final hasCast = credits.cast.isNotEmpty;

          if (!hasGuestStars && !hasCast) {
            return const SizedBox.shrink();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Guest Stars
              if (hasGuestStars) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Guest Stars',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: credits.guestStars.length,
                    itemBuilder: (context, index) {
                      final guest = credits.guestStars[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: _CastCard(
                          name: guest.name,
                          character: guest.character,
                          profilePath: guest.profilePath,
                          isDark: isDark,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Regular Cast
              if (hasCast) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Cast',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: credits.cast.length,
                    itemBuilder: (context, index) {
                      final cast = credits.cast[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: _CastCard(
                          name: cast.name,
                          character: cast.character,
                          profilePath: cast.profilePath,
                          isDark: isDark,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final String name;
  final String character;
  final String? profilePath;
  final bool isDark;

  const _CastCard({
    required this.name,
    required this.character,
    required this.profilePath,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? Colors.grey[850] : Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: profilePath != null
                ? CachedNetworkImage(
                    imageUrl: TMDBImageHelper.getProfile(
                      profilePath!,
                      ProfileSize.w185,
                    ),
                    height: 120,
                    width: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: isDark ? Colors.grey[800] : Colors.grey[300],
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: isDark ? Colors.grey[800] : Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : Container(
                    height: 120,
                    width: 100,
                    color: isDark ? Colors.grey[800] : Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  character,
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}