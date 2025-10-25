import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_details_entity.dart';
import 'package:flutter/material.dart';

class MovieInfoSection extends StatelessWidget {
  final MovieDetailsEntity movie;

  const MovieInfoSection({super.key, required this.movie});

  String _formatRuntime(int? runtime) {
    if (runtime == null) return 'N/A';
    final hours = runtime ~/ 60;
    final minutes = runtime % 60;
    return '${hours}h ${minutes}m';
  }

  String _formatBudget(int? budget) {
    if (budget == null || budget == 0) return 'N/A';
    if (budget >= 1000000000) {
      return '\$${(budget / 1000000000).toStringAsFixed(2)}B';
    }
    if (budget >= 1000000) {
      return '\$${(budget / 1000000).toStringAsFixed(2)}M';
    }
    return '\$$budget';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Stats
          Row(
            children: [
              _StatItem(
                label: 'Release Date',
                value: movie.releaseDate.split('-')[0],
                isDark: isDark,
              ),
              const SizedBox(width: 24),
              _StatItem(
                label: 'Runtime',
                value: _formatRuntime(movie.runtime),
                isDark: isDark,
              ),
              const SizedBox(width: 24),
              _StatItem(
                label: 'Rating',
                value: movie.voteAverage.toStringAsFixed(1),
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
            movie.overview,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),

          // Additional Info
          if (movie.tagline != null && movie.tagline!.isNotEmpty) ...[
            _InfoRow(label: 'Tagline', value: movie.tagline!, isDark: isDark),
            const SizedBox(height: 12),
          ],

          _InfoRow(label: 'Status', value: movie.status, isDark: isDark),
          const SizedBox(height: 12),

          _InfoRow(
            label: 'Original Language',
            value: movie.originalLanguage.toUpperCase(),
            isDark: isDark,
          ),
          const SizedBox(height: 12),

          if (movie.budget != null && movie.budget! > 0) ...[
            _InfoRow(
              label: 'Budget',
              value: _formatBudget(movie.budget),
              isDark: isDark,
            ),
            const SizedBox(height: 12),
          ],

          if (movie.revenue != null && movie.revenue! > 0) ...[
            _InfoRow(
              label: 'Revenue',
              value: _formatBudget(movie.revenue),
              isDark: isDark,
            ),
            const SizedBox(height: 12),
          ],

          // Production Companies
          if (movie.productionCompanies.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'Production Companies',
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
              children: movie.productionCompanies.map((company) {
                return Chip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min, // 👈 This is the key fix

                    children: [
                      if (company.logoPath != null) ...[
                        Image.network(
                          TMDBImageHelper.getLogo(
                            company.logoPath!,
                            LogoSize.w92,
                          ),
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 4),
                      ],
                      SizedBox(width: 4),
                      Text(
                        company.name,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
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
