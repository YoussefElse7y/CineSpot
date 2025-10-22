
import 'package:cine_spot/core/helpers/constants.dart';
import 'package:cine_spot/core/helpers/enums.dart';
import 'package:flutter/material.dart';

class ActiveFiltersChips extends StatelessWidget {
  final String? selectedYear;
  final int? selectedGenreId;
  final String? selectedRegion;
  final SearchCategory selectedCategory;
  final VoidCallback onRemoveYear;
  final VoidCallback onRemoveGenre;
  final VoidCallback onRemoveRegion;

  const ActiveFiltersChips({
    super.key,
    this.selectedYear,
    this.selectedGenreId,
    this.selectedRegion,
    required this.selectedCategory,
    required this.onRemoveYear,
    required this.onRemoveGenre,
    required this.onRemoveRegion,
  });

  String? _getGenreName() {
    if (selectedGenreId == null) return null;

    if (selectedCategory == SearchCategory.movies) {
      return GenreConstants.movieGenres[selectedGenreId];
    } else if (selectedCategory == SearchCategory.tvShows) {
      return GenreConstants.tvGenres[selectedGenreId];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (selectedYear == null &&
        selectedGenreId == null &&
        selectedRegion == null) {
      return const SizedBox.shrink();
    }

    final genreName = _getGenreName();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (selectedYear != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text('Year: $selectedYear'),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: onRemoveYear,
              ),
            ),
          if (genreName != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text('Genre: $genreName'),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: onRemoveGenre,
              ),
            ),
          if (selectedRegion != null)
            Chip(
              label: Text('Region: ${RegionConstants.regions[selectedRegion]}'),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: onRemoveRegion,
            ),
        ],
      ),
    );
  }
}
