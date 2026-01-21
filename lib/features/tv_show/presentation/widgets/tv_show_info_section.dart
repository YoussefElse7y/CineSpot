import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_details_entity.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TvShowInfoSection extends StatelessWidget {
  final TvShowDetailsEntity tvShow;

  const TvShowInfoSection({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TV Show Stats
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              _StatItem(
                label: l10n.first_air,
                value: tvShow.firstAirDate.isNotEmpty
                    ? tvShow.firstAirDate.split('-')[0]
                    : 'N/A',
                isDark: isDark,
              ),
              _StatItem(
                label: l10n.seasons,
                value: tvShow.numberOfSeasons.toString(),
                isDark: isDark,
              ),
              _StatItem(
                label: l10n.episodes,
                value: tvShow.numberOfEpisodes.toString(),
                isDark: isDark,
              ),
              _StatItem(
                label: l10n.rating,
                value: tvShow.voteAverage.toStringAsFixed(1),
                isDark: isDark,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Overview
          Text(
            l10n.overview,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tvShow.overview,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),

          // Additional Info
          if (tvShow.tagline != null && tvShow.tagline!.isNotEmpty) ...[
            _InfoRow(
              label: l10n.tagline,
              value: tvShow.tagline!,
              isDark: isDark,
            ),
            const SizedBox(height: 12),
          ],

          _InfoRow(
            label: l10n.status,
            value: tvShow.inProduction ? 'In Production' : 'Ended',
            isDark: isDark,
          ),
          const SizedBox(height: 12),

          if (tvShow.lastAirDate != null && tvShow.lastAirDate!.isNotEmpty) ...[
            _InfoRow(
              label: l10n.last_air_date,
              value: tvShow.lastAirDate!,
              isDark: isDark,
            ),
            const SizedBox(height: 12),
          ],

          // Created By
          if (tvShow.createdBy.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              l10n.created_by,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tvShow.createdBy.map((creator) {
                return Chip(
                  label: Text(
                    creator.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                );
              }).toList(),
            ),
          ],

          // Networks
          if (tvShow.networks.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              l10n.networks,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tvShow.networks.map((network) {
                return Chip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (network.logoPath != null) ...[
                        Image.network(
                          TMDBImageHelper.getLogo(
                            network.logoPath!,
                            LogoSize.w92,
                          ),
                        ),
                      ] else ...[
                        Text(
                          network.name,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ],
                  ),
                  backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                );
              }).toList(),
            ),
          ],
        ],
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

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.grey[400] : Colors.grey[700],
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
