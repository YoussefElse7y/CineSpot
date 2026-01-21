import 'package:cine_spot/core/helpers/enums.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final SearchCategory selectedCategory;
  final Function(SearchCategory) onCategorySelected;

  const CategoryTabs({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: SearchCategory.values.map((category) {
            final isSelected = selectedCategory == category;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                selected: isSelected,
                label: Text(_getCategoryName(category, l10n)),
                onSelected: (selected) => onCategorySelected(category),
                selectedColor: const Color(0xFFE21221),
                backgroundColor: isDark
                    ? const Color(0xFF1F222B)
                    : const Color(0xFFFAFAFA),
                labelStyle: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : (isDark ? Colors.white70 : Colors.black87),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
