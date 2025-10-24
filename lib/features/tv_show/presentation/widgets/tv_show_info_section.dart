import 'package:cine_spot/features/tv_show/domain/entities/tv_show_details_entity.dart';
import 'package:flutter/material.dart';

class TvShowInfoSection extends StatelessWidget {
  final TvShowDetailsEntity tvShow;

  const TvShowInfoSection({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                label: 'First Air',
                value: tvShow.firstAirDate.isNotEmpty 
                    ? tvShow.firstAirDate.split('-')[0]
                    : 'N/A',
                isDark: isDark,
              ),
              _StatItem(
                label: 'Seasons',
                value: tvShow.numberOfSeasons.toString(),
                isDark: isDark,
              ),
              _StatItem(
                label: 'Episodes',
                value: tvShow.numberOfEpisodes.toString(),
                isDark: isDark,
              ),
              _StatItem(
                label: 'Rating',
                value: tvShow.voteAverage.toStringAsFixed(1),
                isDark: isDark,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Overview
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
              label: 'Tagline',
              value: tvShow.tagline!,
              isDark: isDark,
            ),
            const SizedBox(height: 12),
          ],

          _InfoRow(
            label: 'Status',
            value: tvShow.inProduction ? 'In Production' : 'Ended',
            isDark: isDark,
          ),
          const SizedBox(height: 12),

          if (tvShow.lastAirDate != null && tvShow.lastAirDate!.isNotEmpty) ...[
            _InfoRow(
              label: 'Last Air Date',
              value: tvShow.lastAirDate!,
              isDark: isDark,
            ),
            const SizedBox(height: 12),
          ],

          // Created By
          if (tvShow.createdBy.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'Created By',
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
                  backgroundColor: isDark
                      ? Colors.grey[800]
                      : Colors.grey[200],
                );
              }).toList(),
            ),
          ],

          // Networks
          if (tvShow.networks.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Networks',
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
                  label: Text(
                    network.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  backgroundColor: isDark
                      ? Colors.grey[800]
                      : Colors.grey[200],
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