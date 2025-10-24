import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:cine_spot/features/tv_show/presentation/screens/tv_show_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvShowRecommendationsSection extends StatelessWidget {
  const TvShowRecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<TvShowBloc, TvShowState>(
      buildWhen: (previous, current) =>
          previous.recommendationsStatus != current.recommendationsStatus,
      builder: (context, state) {
        if (state.recommendationsStatus == TvShowRecommendationsStatus.loading) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.recommendationsStatus == TvShowRecommendationsStatus.error) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Failed to load recommendations',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          );
        }

        if (state.recommendationsStatus == TvShowRecommendationsStatus.loaded &&
            state.tvShowRecommendations != null &&
            state.tvShowRecommendations!.results.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recommendations',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 235,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.tvShowRecommendations!.results.length,
                  itemBuilder: (context, index) {
                    final tvShow = state.tvShowRecommendations!.results[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _RecommendationCard(
                        tvShowId: tvShow.id,
                        title: tvShow.name,
                        posterPath: tvShow.posterPath,
                        rating: tvShow.voteAverage,
                        firstAirDate: tvShow.firstAirDate ?? '',
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

class _RecommendationCard extends StatelessWidget {
  final int tvShowId;
  final String title;
  final String? posterPath;
  final double rating;
  final String firstAirDate;
  final bool isDark;

  const _RecommendationCard({
    required this.tvShowId,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.firstAirDate,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final year = firstAirDate.isNotEmpty ? firstAirDate.split('-')[0] : 'N/A';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TvShowDetailsScreen(tvShowId: tvShowId),
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
                              Icons.tv,
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
                            Icons.tv,
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
                        const Icon(Icons.star, color: Colors.amber, size: 12),
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

            // TV Show Info
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    year,
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