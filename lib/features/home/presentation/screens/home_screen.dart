// Optimized home_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/home/presentation/bloc/home_bloc.dart';
import 'package:cine_spot/features/home/presentation/widgets/featured_banner_carousel.dart';
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
          // _appBar(isDark, l10n),
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
                      return FeaturedBannerCarousel(
                        movies: state.topMovies!.results,
                        userId: userId,
                        isDark: isDark,
                        l10n: l10n,
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

  // // OPTIMIZED: Simplified AppBar with less blur
  // SliverAppBar _appBar(bool isDark, AppLocalizations l10n) {
  //   return SliverAppBar(
  //     pinned: true,
  //     floating: false,
  //     automaticallyImplyLeading: false,
  //     centerTitle: true,
  //     elevation: 0,
  //     // Remove expensive BackdropFilter
  //     backgroundColor: isDark
  //         ? const Color(0xFF181A20).withOpacity(0.95)
  //         : Colors.white.withOpacity(0.95),
  //     title: Text(
  //       l10n.home,
  //       style: TextStyle(
  //         fontSize: 24,
  //         fontWeight: FontWeight.bold,
  //         color: isDark ? Colors.white : Colors.black,
  //       ),
  //     ),
  //     actions: [
  //       IconButton(
  //         icon: const Icon(Icons.search),
  //         color: isDark ? Colors.white : Colors.black,
  //         onPressed: () {},
  //       ),
  //       IconButton(
  //         icon: const Icon(Icons.notifications_outlined),
  //         color: isDark ? Colors.white : Colors.black,
  //         onPressed: () {},
  //       ),
  //     ],
  //   );
  // }

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
                    movie.mediaType,
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
                    'movie',
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
                    movie.mediaType,
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
  final String type;

  MovieItem(
    this.id,
    this.title,
    this.rating,
    this.imageUrl,
    this.description,
    this.releaseDate,
    this.type,
  );
}
