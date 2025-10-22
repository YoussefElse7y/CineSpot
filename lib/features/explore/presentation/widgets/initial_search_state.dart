import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/home/domain/entities/trending_tv_show_entity.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class InitialSearchState extends StatelessWidget {
  final AppLocalizations l10n;
  final List<TrendingTvShowEntity> trendingTvShows;

  const InitialSearchState({
    super.key,
    required this.l10n,
    required this.trendingTvShows,
  });

  Widget _buildTopSearchItem(
    String title,
    String imageUrl, {
    String? badge,
    Color? badgeColor,
    String? description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 70,
                color: Colors.grey[800],
                child: const Icon(Icons.movie, color: Colors.white54),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (badge != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: badgeColor ?? Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          description!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Searches Today',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...trendingTvShows
                .map(
                  (tvShow) => _buildTopSearchItem(
                    tvShow.name,
                    TMDBImageHelper.getBackdrop(
                      tvShow.backdropPath ?? tvShow.posterPath!,
                      BackdropSize.w780,
                    ),
                    badge: tvShow.voteAverage.toStringAsFixed(1),
                    badgeColor: ThemeConstants.primaryDark,
                    description: tvShow.originCountry.join(', '),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
