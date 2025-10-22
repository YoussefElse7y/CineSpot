import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/helpers/functions.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBannerCarousel extends StatefulWidget {
  final List<dynamic> movies;
  final String userId;
  final bool isDark;
  final AppLocalizations l10n;

  const FeaturedBannerCarousel({
    super.key,
    required this.movies,
    required this.userId,
    required this.isDark,
    required this.l10n,
  });

  @override
  State<FeaturedBannerCarousel> createState() => _FeaturedBannerCarouselState();
}

class _FeaturedBannerCarouselState extends State<FeaturedBannerCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_currentPage < widget.movies.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _goToNextPage() {
    _autoPlayTimer?.cancel();
    if (_currentPage < widget.movies.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
    _startAutoPlay();
  }

  void _goToPreviousPage() {
    _autoPlayTimer?.cancel();
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
    _startAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          // PageView for movies
          PageView.builder(
            controller: _pageController,
            itemCount: widget.movies.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return _buildBannerContent(
                context,
                movie.id,
                TMDBImageHelper.getPoster(movie.posterPath!, PosterSize.w780),
                movie.title,
                movie.overview,
                movie.genreIds,
              );
            },
          ),

          // Left Arrow Button
          if (_currentPage > 0)
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: AnimatedOpacity(
                  opacity: _currentPage > 0 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: _goToPreviousPage,
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      padding: const EdgeInsets.only(left: 8),
                    ),
                  ),
                ),
              ),
            ),

          // Right Arrow Button
          if (_currentPage < widget.movies.length - 1)
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: AnimatedOpacity(
                  opacity: _currentPage < widget.movies.length - 1 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: _goToNextPage,
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Page Indicator
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.movies.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: _currentPage == index ? 24 : 6,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? ThemeConstants.primaryDark
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerContent(
    BuildContext context,
    int movieId,
    String imageUrl,
    String title,
    String description,
    List<int> genres,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            widget.isDark ? const Color(0xFF181A20) : Colors.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Image with fade animation
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: CachedNetworkImage(
              key: ValueKey(imageUrl),
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 500,
              placeholder: (context, url) => Container(
                color: widget.isDark ? Colors.grey[850] : Colors.grey[300],
              ),
              errorWidget: (context, url, error) => Container(
                color: widget.isDark ? Colors.grey[850] : Colors.grey[300],
                child: const Icon(Icons.error),
              ),
            ),
          ),

          // Favorite button
          Positioned(
            top: 40,
            right: 40,
            child: BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (previous, current) {
                if (previous is Loaded && current is Loaded) {
                  return previous.profile.favoriteIds !=
                      current.profile.favoriteIds;
                }
                return true;
              },
              builder: (context, state) {
                bool isFavorite = false;
                if (state is Loaded) {
                  isFavorite =
                      state.profile.favoriteIds?.contains(movieId) ?? false;
                }
                return Container(
                  decoration: BoxDecoration(
                    color: isFavorite
                        ? ThemeConstants.primaryDark.withOpacity(0.2)
                        : Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (isFavorite) {
                        context.read<ProfileBloc>().add(
                          ProfileEvent.removeFavoriteMovie(
                            widget.userId,
                            movieId,
                          ),
                        );
                      } else {
                        context.read<ProfileBloc>().add(
                          ProfileEvent.addFavoriteMovie(widget.userId, movieId),
                        );
                      }
                    },
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: isFavorite
                          ? ThemeConstants.primaryDark
                          : Colors.white,
                      size: 28,
                    ),
                  ),
                );
              },
            ),
          ),

          // Content with slide animation
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Column(
                key: ValueKey(movieId),
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[300],
                        shadows: const [
                          Shadow(color: Colors.black, blurRadius: 10),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children:
                        getGenreNamesByLanguage(
                          genres,
                          language: widget.l10n.locale_language,
                        ).map((genre) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Text(
                              genre,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow),
                        label: Text(widget.l10n.play),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeConstants.primaryDark,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                        ),
                      ),
                      const SizedBox(width: 12),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        buildWhen: (previous, current) {
                          if (previous is Loaded && current is Loaded) {
                            return previous.profile.wishlistIds !=
                                current.profile.wishlistIds;
                          }
                          return true;
                        },
                        builder: (context, state) {
                          bool isExist = false;
                          if (state is Loaded) {
                            isExist =
                                state.profile.wishlistIds?.contains(movieId) ??
                                false;
                          }
                          return OutlinedButton.icon(
                            onPressed: () {
                              if (isExist) {
                                context.read<ProfileBloc>().add(
                                  ProfileEvent.removeWishlistMovie(
                                    widget.userId,
                                    movieId,
                                  ),
                                );
                              } else {
                                context.read<ProfileBloc>().add(
                                  ProfileEvent.addWishlistMovie(
                                    widget.userId,
                                    movieId,
                                  ),
                                );
                              }
                            },
                            icon: Icon(isExist ? Icons.check : Icons.add),
                            label: Text(widget.l10n.myList),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                color: isExist
                                    ? ThemeConstants.primaryDark
                                    : Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: isExist
                                  ? ThemeConstants.primaryDark.withOpacity(0.2)
                                  : Colors.black26,
                              elevation: 2,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
