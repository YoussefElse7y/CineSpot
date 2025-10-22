
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final VoidCallback onFilterTap;
  final bool hasActiveFilters;
  final VoidCallback onClearSearch;

  const SearchHeader({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
    required this.onFilterTap,
    required this.hasActiveFilters,
    required this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF1F222B)
                    : const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: searchController,
                focusNode: searchFocusNode,
                decoration: InputDecoration(
                  hintText: l10n.search,
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: onClearSearch,
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE21221).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Badge(
                isLabelVisible: hasActiveFilters,
                label: const Text(''),
                child: const Icon(Icons.tune, color: Color(0xFFE21221)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
