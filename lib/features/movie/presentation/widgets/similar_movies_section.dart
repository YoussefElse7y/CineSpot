import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/helpers/functions.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_bloc.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_state.dart';
import 'package:cine_spot/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:cine_spot/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarMoviesSection extends StatelessWidget {
  const SimilarMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.similarStatus != current.similarStatus,
      builder: (context, state) {
        if (state.similarStatus == MovieSimilarStatus.loading) {
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.similarStatus == MovieSimilarStatus.error) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Failed to load similar movies',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          );
        }

        if (state.similarStatus == MovieSimilarStatus.loaded &&
            state.similarMovies != null &&
            state.similarMovies!.results.isNotEmpty) {
          final languageBloc = context.read<LanguageBloc>();
          final currentLanguage = (languageBloc.state is LanguageLoaded)
              ? (languageBloc.state as LanguageLoaded).language.code
              : 'en';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Similar Movies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.similarMovies!.results.length,
                  itemBuilder: (context, index) {
                    final movie = state.similarMovies!.results[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _SimilarMovieCard(
                        movieId: movie.id,
                        title: movie.title,
                        posterPath: movie.posterPath,
                        rating: movie.voteAverage,
                        releaseDate: movie.releaseDate,
                        genreIds: movie.genreIds,
                        language: currentLanguage,
                        isDark: isDark,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _SimilarMovieCard extends StatelessWidget {
  final int movieId;
  final String title;
  final String? posterPath;
  final double rating;
  final String releaseDate;
  final List<int> genreIds;
  final String language;
  final bool isDark;

  const _SimilarMovieCard({
    required this.movieId,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.releaseDate,
    required this.genreIds,
    required this.language,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final genres = getGenreNamesByLanguage(genreIds.take(2).toList(), language: language);
    final year = releaseDate.isNotEmpty ? releaseDate.split('-')[0] : 'N/A';

    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movieId: movieId),
          ),
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: posterPath != null
                      ? CachedNetworkImage(
                          imageUrl: TMDBImageHelper.getPoster(
                            posterPath!,
                            PosterSize.w342,
                          ),
                          height: 180,
                          width: 140,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: isDark ? Colors.grey[800] : Colors.grey[300],
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: isDark ? Colors.grey[800] : Colors.grey[300],
                            child: const Icon(
                              Icons.movie,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Container(
                          height: 180,
                          width: 140,
                          color: isDark ? Colors.grey[800] : Colors.grey[300],
                          child: const Icon(
                            Icons.movie,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                ),
                // Rating Badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 12,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          rating.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Movie Info
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$year • ${genres.join(', ')}',
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
      ),
    );
  }
}