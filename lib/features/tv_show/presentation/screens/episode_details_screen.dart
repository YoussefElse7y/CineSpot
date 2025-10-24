import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/di/injection_container.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_bloc.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_state.dart';
import 'package:cine_spot/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/episode_cast_section.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/episode_trailers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodeDetailsScreen extends StatelessWidget {
  final int tvShowId;
  final int seasonNumber;
  final int episodeNumber;

  const EpisodeDetailsScreen({
    super.key,
    required this.tvShowId,
    required this.seasonNumber,
    required this.episodeNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final languageBloc = context.read<LanguageBloc>();
        final currentLanguage = (languageBloc.state is LanguageLoaded)
            ? (languageBloc.state as LanguageLoaded).language.code
            : 'en';

        return sl<TvShowBloc>()
          ..add(TvShowEvent.loadEpisodeDetails(
            tvShowId,
            seasonNumber,
            episodeNumber,
            language: currentLanguage,
          ))
          ..add(TvShowEvent.loadEpisodeCredits(
            tvShowId,
            seasonNumber,
            episodeNumber,
            language: currentLanguage,
          ))
          ..add(TvShowEvent.loadEpisodeVideos(
            tvShowId,
            seasonNumber,
            episodeNumber,
            language: currentLanguage,
          ));
      },
      child: const EpisodeDetailsView(),
    );
  }
}

class EpisodeDetailsView extends StatelessWidget {
  const EpisodeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (context, state) {
          if (state.episodeDetailsStatus == EpisodeDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.episodeDetailsStatus == EpisodeDetailsStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.episodeDetailsError ?? 'An error occurred',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          if (state.episodeDetailsStatus == EpisodeDetailsStatus.loaded &&
              state.episodeDetails != null) {
            final episode = state.episodeDetails!;

            return CustomScrollView(
              slivers: [
                // Episode Header
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (episode.stillPath != null)
                          CachedNetworkImage(
                            imageUrl: TMDBImageHelper.getStill(
                              episode.stillPath!,
                              StillSize.w300,
                            ),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: isDark ? Colors.grey[850] : Colors.grey[300],
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: isDark ? Colors.grey[850] : Colors.grey[300],
                              child: const Icon(Icons.tv, size: 80),
                            ),
                          ),
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
                        Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                    const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      episode.voteAverage?.toStringAsFixed(1) ?? 'N/A',
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
                              Text(
                                episode.name ?? 'Unknown Episode',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Season ${episode.seasonNumber} • Episode ${episode.episodeNumber}',
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Episode Info
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Episode Stats
                        Wrap(
                          spacing: 24,
                          runSpacing: 12,
                          children: [
                            if (episode.airDate != null && episode.airDate!.isNotEmpty)
                              _StatItem(
                                label: 'Air Date',
                                value: episode.airDate!,
                                isDark: isDark,
                              ),
                            if (episode.runtime != null)
                              _StatItem(
                                label: 'Runtime',
                                value: '${episode.runtime}m',
                                isDark: isDark,
                              ),
                            if (episode.voteAverage != null)
                              _StatItem(
                                label: 'Rating',
                                value: episode.voteAverage!.toStringAsFixed(1),
                                isDark: isDark,
                              ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Overview
                        if (episode.overview != null && episode.overview!.isNotEmpty) ...[
                          Text(
                            'Overview',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            episode.overview!,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: isDark ? Colors.grey[300] : Colors.grey[700],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                // Cast Section (Crew + Guest Stars)
                const SliverToBoxAdapter(child: EpisodeCastSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Trailers Section
                const SliverToBoxAdapter(child: EpisodeTrailersSection()),
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

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const _StatItem({
    required this.label,
    required this.value,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}