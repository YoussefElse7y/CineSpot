// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:cine_spot/core/helpers/functions.dart';
import 'package:cine_spot/core/network/api_constants.dart';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/home/presentation/bloc/home_bloc.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // String language = Localizations.localeOf(context).languageCode;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(isDark),
          // Main Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🎬 Featured Movie/Show Banner
                BlocBuilder<HomeBloc, HomeState>(
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
                        isDark,
                        '${ApiConstants.baseImageUrl}${randomMovie.posterPath}',
                        randomMovie.title,
                        randomMovie.overview,
                        randomMovie.genreIds,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),

                const SizedBox(height: 24),
                // Top Movies This Week
                _topMoviesThisWeek(),
                const SizedBox(height: 24),
                // Now Playing
                _nowPlaying(),
                const SizedBox(height: 24),
                // Trending Now
                _trendingTvShows(),
                const SizedBox(height: 160),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _appBar(bool isDark) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 50,

      backgroundColor: Colors.transparent,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color:
                  (isDark
                          ? Colors.black.withOpacity(0.35)
                          : Colors.white.withOpacity(0.35))
                      .withOpacity(0.35),
              boxShadow: [
                BoxShadow(
                  color: ThemeConstants.primaryDark.withOpacity(0.1),
                  blurRadius: 25,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
      title: Text(
        'Home',
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

  BlocBuilder<HomeBloc, HomeState> _topMoviesThisWeek() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingTopMovies) {
          return SizedBox(
            height: 240,
            child: const Center(
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
            'Top Movies This Week',
            state.topMovies!.results
                .map(
                  (movie) => MovieItem(
                    movie.id,
                    movie.title,
                    movie.voteAverage,
                    '${ApiConstants.baseImageUrl}${movie.posterPath}',
                    movie.overview,
                    movie.releaseDate,
                  ),
                )
                .toList(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  BlocBuilder<HomeBloc, HomeState> _nowPlaying() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingNowPlaying) {
          return SizedBox(
            height: 240,
            child: const Center(
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
            'Now Playing',
            state.nowPlayingMovies!
                .map(
                  (movie) => MovieItem(
                    movie.id,
                    movie.title,
                    movie.voteAverage,
                    '${ApiConstants.baseImageUrl}${movie.posterPath}',
                    movie.overview,
                    movie.releaseDate,
                  ),
                )
                .toList(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

    BlocBuilder<HomeBloc, HomeState> _trendingTvShows() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingTrendingTvShows) {
          return SizedBox(
            height: 240,
            child: const Center(
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
            'Trending TV Shows',
            state.trendingTvShows!
                .map(
                  (movie) => MovieItem(
                    movie.id,
                    movie.name,
                    movie.voteAverage,
                    '${ApiConstants.baseImageUrl}${movie.posterPath}',
                    movie.overview,
                    movie.firstAirDate,
                  ),
                )
                .toList(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildFeaturedBanner(
    BuildContext context,
    AppLocalizations l10n,

    bool isDark,
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
          // Background Image
          Container(
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[850] : Colors.grey[300],
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
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
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                  ),
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
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 8.0)),
                Wrap(
                  spacing: 8, // horizontal space
                  runSpacing: 8, // vertical space
                  children:
                      getGenreNamesByLanguage(
                        genres,
                        language: l10n.locale_language,
                      ).map((genre) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            genre,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Play Button (Glassy + Glow)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Play'),
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
                            shadowColor: ThemeConstants.primaryDark,
                            elevation: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // My List Button (Glassy + Glow)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text('My List'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shadowColor: Colors.white.withOpacity(0.8),
                            elevation: 8,
                            backgroundColor: Colors.white.withOpacity(0.08),
                          ),
                        ),
                      ),
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
                    Routes.DetailsScreen,
                    arguments: {'movies': movies, 'title': title},
                  );
                },
                child: const Text(
                  'See all',
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
          // Movie Poster
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Container(
                  height: 240,
                  width: 160,
                  color: isDark ? Colors.grey[800] : Colors.grey[300],
                  child: Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.movie, size: 60, color: Colors.grey),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Rating Badge
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
