import 'package:cine_spot/core/di/injection_container.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_bloc.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_state.dart';
import 'package:cine_spot/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:cine_spot/features/movie/presentation/widgets/cast_section.dart';
import 'package:cine_spot/features/movie/presentation/widgets/movie_header.dart';
import 'package:cine_spot/features/movie/presentation/widgets/movie_info_section.dart';
import 'package:cine_spot/features/movie/presentation/widgets/recommendations_section.dart';
import 'package:cine_spot/features/movie/presentation/widgets/reviews_section.dart';
import 'package:cine_spot/features/movie/presentation/widgets/similar_movies_section.dart';
import 'package:cine_spot/features/movie/presentation/widgets/trailers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final languageBloc = context.read<LanguageBloc>();
        final currentLanguage = (languageBloc.state is LanguageLoaded)
            ? (languageBloc.state as LanguageLoaded).language.code
            : 'en';

        return sl<MovieBloc>()
          ..add(MovieEvent.loadMovieDetails(movieId, language: currentLanguage))
          ..add(MovieEvent.loadCredits(movieId, language: currentLanguage))
          ..add(MovieEvent.loadVideos(movieId, language: currentLanguage))
          ..add(MovieEvent.loadSimilarMovies(movieId, language: currentLanguage))
          ..add(MovieEvent.loadRecommendations(movieId, language: currentLanguage))
          ..add(MovieEvent.loadReviews(movieId, language: currentLanguage));
      },
      child: const MovieDetailsView(),
    );
  }
}

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state.detailsStatus == MovieDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.detailsStatus == MovieDetailsStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.detailsError ?? 'An error occurred',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final languageBloc = context.read<LanguageBloc>();
                      final currentLanguage = (languageBloc.state is LanguageLoaded)
                          ? (languageBloc.state as LanguageLoaded).language.code
                          : 'en';
                      
                      context.read<MovieBloc>().add(
                        MovieEvent.loadMovieDetails(
                          state.movieDetails?.id ?? 0,
                          language: currentLanguage,
                        ),
                      );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state.detailsStatus == MovieDetailsStatus.loaded &&
              state.movieDetails != null) {
            final movie = state.movieDetails!;

            return CustomScrollView(
              slivers: [
                // Movie Header with backdrop
                SliverAppBar(
                  expandedHeight: 400,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: MovieHeader(movie: movie),
                  ),
                ),

                // Movie Info Section
                SliverToBoxAdapter(
                  child: MovieInfoSection(movie: movie),
                ),

                // Cast Section
                const SliverToBoxAdapter(
                  child: CastSection(),
                ),

                // Trailers Section
                const SliverToBoxAdapter(
                  child: TrailersSection(),
                ),

                // Similar Movies Section
                const SliverToBoxAdapter(
                  child: SimilarMoviesSection(),
                ),

                // Recommendations Section
                const SliverToBoxAdapter(
                  child: RecommendationsSection(),
                ),

                // Reviews Section
                const SliverToBoxAdapter(
                  child: ReviewsSection(),
                ),

                // Bottom padding
                const SliverToBoxAdapter(
                  child: SizedBox(height: 32),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}