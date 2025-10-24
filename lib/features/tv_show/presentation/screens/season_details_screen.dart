import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/di/injection_container.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_bloc.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_state.dart';
import 'package:cine_spot/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:cine_spot/features/tv_show/presentation/screens/episode_details_screen.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/season_cast_section.dart';
import 'package:cine_spot/features/tv_show/presentation/widgets/season_trailers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonDetailsScreen extends StatelessWidget {
  final int tvShowId;
  final int seasonNumber;

  const SeasonDetailsScreen({
    super.key,
    required this.tvShowId,
    required this.seasonNumber,
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
          ..add(TvShowEvent.loadSeasonDetails(
            tvShowId,
            seasonNumber,
            language: currentLanguage,
          ))
          ..add(TvShowEvent.loadSeasonCredits(
            tvShowId,
            seasonNumber,
            language: currentLanguage,
          ))
          ..add(TvShowEvent.loadSeasonVideos(
            tvShowId,
            seasonNumber,
            language: currentLanguage,
          ));
      },
      child:  SeasonDetailsView(tvShowId: tvShowId,),
    );
  }
}

class SeasonDetailsView extends StatelessWidget {
  const SeasonDetailsView({super.key
,      required this.tvShowId, // ✅ Add this parameter

  });
    final int tvShowId; // ✅ Add this parameter


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (context, state) {
          if (state.seasonDetailsStatus == SeasonDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.seasonDetailsStatus == SeasonDetailsStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.seasonDetailsError ?? 'An error occurred',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          if (state.seasonDetailsStatus == SeasonDetailsStatus.loaded &&
              state.seasonDetails != null) {
            final season = state.seasonDetails!;

            return CustomScrollView(
              slivers: [
                // Season Header
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (season.posterPath != null)
                          CachedNetworkImage(
                            imageUrl: TMDBImageHelper.getPoster(
                              season.posterPath!,
                              PosterSize.w780,
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
                              Text(
                                season.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${season.episodes.length} Episodes',
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

                // Season Overview
                if (season.overview.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            season.overview,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: isDark ? Colors.grey[300] : Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Cast Section
                const SliverToBoxAdapter(child: SeasonCastSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Trailers Section
                const SliverToBoxAdapter(child: SeasonTrailersSection()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                // Episodes Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Episodes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 12)),

                // Episodes List
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final episode = season.episodes[index];
                      return _EpisodeCard(
                        tvShowId: tvShowId,
                        seasonNumber: season.seasonNumber,
                        episode: episode,
                        isDark: isDark,
                      );
                    },
                    childCount: season.episodes.length,
                  ),
                ),

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

class _EpisodeCard extends StatelessWidget {
  final int tvShowId;
  final int seasonNumber;
  final dynamic episode;
  final bool isDark;

  const _EpisodeCard({
    required this.tvShowId,
    required this.seasonNumber,
    required this.episode,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EpisodeDetailsScreen(
                tvShowId: tvShowId,
                seasonNumber: seasonNumber,
                episodeNumber: episode.episodeNumber,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[850] : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Episode Still
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: episode.stillPath != null
                    ? CachedNetworkImage(
                        imageUrl: TMDBImageHelper.getStill(
                          episode.stillPath!,
                          StillSize.w300,
                        ),
                        width: 140,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 140,
                          height: 100,
                          color: isDark ? Colors.grey[800] : Colors.grey[300],
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 140,
                          height: 100,
                          color: isDark ? Colors.grey[800] : Colors.grey[300],
                          child: const Icon(Icons.tv, size: 30, color: Colors.grey),
                        ),
                      )
                    : Container(
                        width: 140,
                        height: 100,
                        color: isDark ? Colors.grey[800] : Colors.grey[300],
                        child: const Icon(Icons.tv, size: 30, color: Colors.grey),
                      ),
              ),

              // Episode Info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE21221),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'E${episode.episodeNumber}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (episode.runtime != null)
                            Text(
                              '${episode.runtime}m',
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? Colors.grey[400] : Colors.grey[600],
                              ),
                            ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                episode.voteAverage.toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        episode.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        episode.overview,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (episode.airDate != null && episode.airDate!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          episode.airDate!,
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark ? Colors.grey[500] : Colors.grey[500],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}