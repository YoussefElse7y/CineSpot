
import 'package:cine_spot/core/helpers/constants.dart';
import 'package:cine_spot/core/helpers/enums.dart';
import 'package:cine_spot/features/explore/presentation/widgets/filter_section.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  final SearchCategory tempCategory;
  final String? tempYear;
  final int? tempGenreId;
  final String? tempRegion;
  final SortOption tempSort;
  final Function(SearchCategory) onCategoryChanged;
  final Function(String?) onYearChanged;
  final Function(int?) onGenreChanged;
  final Function(String?) onRegionChanged;
  final Function(SortOption) onSortChanged;
  final VoidCallback onReset;
  final VoidCallback onApply;

  const FilterBottomSheet({
    super.key,
    required this.tempCategory,
    this.tempYear,
    this.tempGenreId,
    this.tempRegion,
    required this.tempSort,
    required this.onCategoryChanged,
    required this.onYearChanged,
    required this.onGenreChanged,
    required this.onRegionChanged,
    required this.onSortChanged,
    required this.onReset,
    required this.onApply,
  });

  List<String> get _years =>
      List.generate(30, (index) => (DateTime.now().year - index).toString());

  Map<int, String> get _currentGenres {
    if (tempCategory == SearchCategory.movies) {
      return GenreConstants.movieGenres;
    } else if (tempCategory == SearchCategory.tvShows) {
      return GenreConstants.tvGenres;
    }
    return {};
  }

  String _getCategoryName(SearchCategory category, AppLocalizations l10n) {
    switch (category) {
      case SearchCategory.multi:
        return l10n.all;
      case SearchCategory.movies:
        return l10n.movies;
      case SearchCategory.tvShows:
        return l10n.tvShows;
      case SearchCategory.people:
        return l10n.people;
      case SearchCategory.companies:
        return l10n.companies;
    }
  }

  String _getSortName(SortOption sort) {
    switch (sort) {
      case SortOption.popularity:
        return 'Popularity';
      case SortOption.latest:
        return 'Latest Release';
      case SortOption.rating:
        return 'Rating';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF181A20) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Sort & Filter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE21221),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterSection(
                    title: 'Categories',
                    options: SearchCategory.values
                        .map((c) => _getCategoryName(c, l10n))
                        .toList(),
                    selectedValue: _getCategoryName(tempCategory, l10n),
                    onSelected: (value) {
                      final category = SearchCategory.values.firstWhere(
                        (c) => _getCategoryName(c, l10n) == value,
                      );
                      onCategoryChanged(category);
                    },
                  ),
                  const SizedBox(height: 24),
                  if (tempCategory == SearchCategory.movies ||
                      tempCategory == SearchCategory.tvShows) ...[
                    FilterSection(
                      title: 'Year',
                      options: ['All Years', ..._years.take(15)],
                      selectedValue: tempYear ?? 'All Years',
                      onSelected: (value) =>
                          onYearChanged(value == 'All Years' ? null : value),
                    ),
                    const SizedBox(height: 24),
                    if (_currentGenres.isNotEmpty)
                      FilterSection(
                        title: 'Genre',
                        options: ['All Genres', ..._currentGenres.values],
                        selectedValue: tempGenreId != null
                            ? _currentGenres[tempGenreId]!
                            : 'All Genres',
                        onSelected: (value) {
                          if (value == 'All Genres') {
                            onGenreChanged(null);
                          } else {
                            final genreId = _currentGenres.entries
                                .firstWhere((e) => e.value == value)
                                .key;
                            onGenreChanged(genreId);
                          }
                        },
                      ),
                    const SizedBox(height: 24),
                  ],
                  if (tempCategory == SearchCategory.movies) ...[
                    FilterSection(
                      title: 'Region',
                      options: [
                        'All Regions',
                        ...RegionConstants.regions.values,
                      ],
                      selectedValue: tempRegion != null
                          ? RegionConstants.regions[tempRegion]!
                          : 'All Regions',
                      onSelected: (value) {
                        if (value == 'All Regions') {
                          onRegionChanged(null);
                        } else {
                          final regionCode = RegionConstants.regions.entries
                              .firstWhere((e) => e.value == value)
                              .key;
                          onRegionChanged(regionCode);
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                  FilterSection(
                    title: 'Sort By',
                    options: SortOption.values.map(_getSortName).toList(),
                    selectedValue: _getSortName(tempSort),
                    onSelected: (value) {
                      final sort = SortOption.values.firstWhere(
                        (s) => _getSortName(s) == value,
                      );
                      onSortChanged(sort);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onReset,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: isDark ? Colors.white30 : Colors.black26,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text('Reset'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: onApply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE21221),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Apply',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
