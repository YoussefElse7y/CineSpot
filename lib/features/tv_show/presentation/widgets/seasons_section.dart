import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:cine_spot/features/tv_show/presentation/screens/season_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonsSection extends StatelessWidget {
  const SeasonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<TvShowBloc, TvShowState>(
      buildWhen: (previous, current) =>
          previous.detailsStatus != current.detailsStatus,
      builder: (context, state) {
        if (state.detailsStatus == TvShowDetailsStatus.loaded &&
            state.tvShowDetails != null &&
            state.tvShowDetails!.seasons.isNotEmpty) {
          final seasons = state.tvShowDetails!.seasons;
          final tvShowId = state.tvShowDetails!.id;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Seasons',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: seasons.length,
                  itemBuilder: (context, index) {
                    final season = seasons[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _SeasonCard(
                        tvShowId: tvShowId,
                        season: season,
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

class _SeasonCard extends StatelessWidget {
  final int tvShowId;
  final dynamic season;
  final bool isDark;

  const _SeasonCard({
    required this.tvShowId,
    required this.season,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SeasonDetailsScreen(
              tvShowId: tvShowId,
              seasonNumber: season.seasonNumber,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
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
                  child: season.posterPath != null
                      ? CachedNetworkImage(
                          imageUrl: TMDBImageHelper.getPoster(
                            season.posterPath!,
                            PosterSize.w342,
                          ),
                          height: 200,
                          width: 160,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: isDark ? Colors.grey[800] : Colors.grey[300],
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: isDark ? Colors.grey[800] : Colors.grey[300],
                            child: const Icon(
                              Icons.tv,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Container(
                          height: 200,
                          width: 160,
                          color: isDark ? Colors.grey[800] : Colors.grey[300],
                          child: const Icon(
                            Icons.tv,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                ),
                // Episode Count Badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${season.episodeCount} episodes',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Season Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    season.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (season.airDate != null && season.airDate!.isNotEmpty)
                    Text(
                      season.airDate!.split('-')[0],
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        season.voteAverage.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
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
