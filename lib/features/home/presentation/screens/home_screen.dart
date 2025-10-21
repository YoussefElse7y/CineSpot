// Optimized home_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/helpers/functions.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/home/presentation/bloc/home_bloc.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        // Add cacheExtent to preload content
        cacheExtent: 500,
        slivers: [
          _appBar(isDark, l10n),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Featured Banner
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.topMovies != current.topMovies,
                  builder: (context, state) {
                    if (state.isLoadingTopMovies) {
                      return const SizedBox(
                        height: 500,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state.topMovies != null &&
                        state.topMovies!.results.isNotEmpty) {
                      final randomMovie = getRandomElement(
                        state.topMovies!.results,
                      );
                      return _buildFeaturedBanner(
                        context,
                        l10n,
                        userId,
                        isDark,
                        randomMovie.id,
                        TMDBImageHelper.getPoster(
                          randomMovie.posterPath!,
                          PosterSize.w500,
                        ),
                        randomMovie.title,
                        randomMovie.overview,
                        randomMovie.genreIds,
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 24),
                _topMoviesThisWeek(l10n),
                const SizedBox(height: 24),
                _nowPlaying(l10n),
                const SizedBox(height: 24),
                _trendingTvShows(l10n),
                const SizedBox(height: 160),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // OPTIMIZED: Simplified AppBar with less blur
  SliverAppBar _appBar(bool isDark, AppLocalizations l10n) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      // Remove expensive BackdropFilter
      backgroundColor: isDark
          ? const Color(0xFF181A20).withOpacity(0.95)
          : Colors.white.withOpacity(0.95),
      title: Text(
        l10n.home,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: isDark ? Colors.white : Colors.black,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          color: isDark ? Colors.white : Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }

  BlocBuilder<HomeBloc, HomeState> _topMoviesThisWeek(
    AppLocalizations localization,
  ) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.topMovies != current.topMovies,
      builder: (context, state) {
        if (state.isLoadingTopMovies) {
          return const SizedBox(
            height: 240,
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state.topMovies != null) {
          return _buildMovieSection(
            context,
            localization.topMoviesThisWeek,
            state.topMovies!.results
                .map(
                  (movie) => MovieItem(
                    movie.id,
                    movie.title,
                    movie.voteAverage,
                    TMDBImageHelper.getPoster(
                      movie.posterPath!,
                      PosterSize.w185,
                    ),
                    movie.overview,
                    movie.releaseDate,
                  ),
                )
                .toList(),
            localization,
          );
        }
        return const SizedBox();
      },
    );
  }

  BlocBuilder<HomeBloc, HomeState> _nowPlaying(AppLocalizations l10n) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingMovies != current.nowPlayingMovies,
      builder: (context, state) {
        if (state.isLoadingNowPlaying) {
          return const SizedBox(
            height: 240,
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state.nowPlayingMovies != null) {
          return _buildMovieSection(
            context,
            l10n.nowPlaying,
            state.nowPlayingMovies!
                .map(
                  (movie) => MovieItem(
                    movie.id,
                    movie.title,
                    movie.voteAverage,
                    TMDBImageHelper.getPoster(
                      movie.posterPath!,
                      PosterSize.w185,
                    ),
                    movie.overview,
                    movie.releaseDate,
                  ),
                )
                .toList(),
            l10n,
          );
        }
        return const SizedBox();
      },
    );
  }

  BlocBuilder<HomeBloc, HomeState> _trendingTvShows(AppLocalizations l10n) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.trendingTvShows != current.trendingTvShows,
      builder: (context, state) {
        if (state.isLoadingTrendingTvShows) {
          return const SizedBox(
            height: 240,
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state.trendingTvShows != null) {
          return _buildMovieSection(
            context,
            l10n.trendingTvShows,
            state.trendingTvShows!
                .map(
                  (movie) => MovieItem(
                    movie.id,
                    movie.name,
                    movie.voteAverage,
                    TMDBImageHelper.getPoster(
                      movie.posterPath!,
                      PosterSize.w185,
                    ),
                    movie.overview,
                    movie.firstAirDate,
                  ),
                )
                .toList(),
            l10n,
          );
        }
        return const SizedBox();
      },
    );
  }

  // OPTIMIZED: Simplified featured banner
  Widget _buildFeaturedBanner(
    BuildContext context,
    AppLocalizations l10n,
    String userId,
    bool isDark,
    int movieId,
    String imageUrl,
    String title,
    String description,
    List<int> genres,
  ) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            isDark ? const Color(0xFF181A20) : Colors.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          // OPTIMIZED: Use cached network image
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 500,
            placeholder: (context, url) =>
                Container(color: isDark ? Colors.grey[850] : Colors.grey[300]),
            errorWidget: (context, url, error) => Container(
              color: isDark ? Colors.grey[850] : Colors.grey[300],
              child: const Icon(Icons.error),
            ),
          ),

          // OPTIMIZED: Simpler favorite button
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
                          ProfileEvent.removeFavoriteMovie(userId, movieId),
                        );
                      } else {
                        context.read<ProfileBloc>().add(
                          ProfileEvent.addFavoriteMovie(userId, movieId),
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

          // Content
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
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
                const Padding(padding: EdgeInsets.only(top: 8.0)),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children:
                      getGenreNamesByLanguage(
                        genres,
                        language: l10n.locale_language,
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
                    // OPTIMIZED: Removed BackdropFilter
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: Text(l10n.play),
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
                                  userId,
                                  movieId,
                                ),
                              );
                            } else {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.addWishlistMovie(userId, movieId),
                              );
                            }
                          },
                          icon: Icon(isExist ? Icons.check : Icons.add),
                          label: Text(l10n.myList),
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
        ],
      ),
    );
  }

  Widget _buildMovieSection(
    BuildContext context,

    String title,
    List<MovieItem> movies,
    AppLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.detailsScreen,
                    arguments: {'movies': movies, 'title': title},
                  );
                },
                child: Text(
                  l10n.seeAll,
                  style: TextStyle(
                    color: ThemeConstants.primaryDark,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length,
            // OPTIMIZED: Add cache extent
            cacheExtent: 500,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: _buildMovieCard(context, movie),
              );
            },
          ),
        ),
      ],
    );
  }

  // OPTIMIZED: Use cached images
  Widget _buildMovieCard(BuildContext context, MovieItem movie) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? Colors.grey[850] : Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: movie.imageUrl,
                  height: 240,
                  width: 160,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: isDark ? Colors.grey[800] : Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: isDark ? Colors.grey[800] : Colors.grey[300],
                    child: const Icon(
                      Icons.movie,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE21221),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    movie.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MovieItem {
  int id;
  final String title;
  final double rating;
  final String imageUrl;
  final String description;
  final String releaseDate;

  MovieItem(
    this.id,
    this.title,
    this.rating,
    this.imageUrl,
    this.description,
    this.releaseDate,
  );
}
