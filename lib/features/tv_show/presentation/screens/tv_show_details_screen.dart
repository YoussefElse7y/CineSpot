import 'package:cine_spot/core/di/injection_container.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_bloc.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_state.dart';
import 'package:cine_spot/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/tv_show_cast_section.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/tv_show_header.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/tv_show_info_section.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/tv_show_recommendations_section.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/tv_show_reviews_section.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/tv_show_trailers_section.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/seasons_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvShowDetailsScreen extends StatelessWidget {
  final int tvShowId;

  const TvShowDetailsScreen({super.key, required this.tvShowId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final languageBloc = context.read<LanguageBloc>();
        final currentLanguage = (languageBloc.state is LanguageLoaded)
            ? (languageBloc.state as LanguageLoaded).language.code
            : 'en';

        return sl<TvShowBloc>()
          ..add(TvShowEvent.loadTvShowDetails(tvShowId, language: currentLanguage))
          ..add(TvShowEvent.loadTvShowCredits(tvShowId, language: currentLanguage))
          ..add(TvShowEvent.loadTvShowVideos(tvShowId, language: currentLanguage))
          ..add(TvShowEvent.loadTvShowRecommendations(tvShowId, language: currentLanguage))
          ..add(TvShowEvent.loadTvShowReviews(tvShowId, language: currentLanguage));
      },
      child: const TvShowDetailsView(),
    );
  }
}

class TvShowDetailsView extends StatelessWidget {
  const TvShowDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (context, state) {
          if (state.detailsStatus == TvShowDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.detailsStatus == TvShowDetailsStatus.error) {
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
                      final currentLanguage =
                          (languageBloc.state is LanguageLoaded)
                          ? (languageBloc.state as LanguageLoaded).language.code
                          : 'en';

                      context.read<TvShowBloc>().add(
                        TvShowEvent.loadTvShowDetails(
                          state.tvShowDetails?.id ?? 0,
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

          if (state.detailsStatus == TvShowDetailsStatus.loaded &&
              state.tvShowDetails != null) {
            final tvShow = state.tvShowDetails!;

            return CustomScrollView(
              slivers: [
                // TV Show Header with backdrop
                SliverAppBar(
                  expandedHeight: 400,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: TvShowHeader(tvShow: tvShow),
                  ),
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                ),

                // TV Show Info Section
                SliverToBoxAdapter(child: TvShowInfoSection(tvShow: tvShow)),

                // Cast Section
                const SliverToBoxAdapter(child: TvShowCastSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Seasons Section
                const SliverToBoxAdapter(child: SeasonsSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Trailers Section
                const SliverToBoxAdapter(child: TvShowTrailersSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Recommendations Section
                const SliverToBoxAdapter(child: TvShowRecommendationsSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Reviews Section
                const SliverToBoxAdapter(child: TvShowReviewsSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Bottom padding
                const SliverToBoxAdapter(child: SizedBox(height: 50)),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}