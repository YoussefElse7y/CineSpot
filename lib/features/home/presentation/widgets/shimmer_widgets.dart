import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgets {
  // Helper method to get shimmer colors based on theme
  static Color getBaseColor(bool isDark) {
    return isDark ? Colors.grey[900]! : Colors.grey[300]!;
  }

  static Color getHighlightColor(bool isDark) {
    return isDark ? Colors.grey[700]! : Colors.grey[100]!;
  }

  // Shimmer for Featured Banner
  static Widget featuredBannerShimmer(bool isDark) {
    return Container(
      height: 500,
      color: isDark ? const Color(0xFF181A20) : Colors.white,
      child: Stack(
        children: [
          Shimmer.fromColors(
            baseColor: getBaseColor(isDark),
            highlightColor: getHighlightColor(isDark),
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey[400]!,
                    Colors.grey[300]!,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Column(
              children: [
                // Title shimmer
                Shimmer.fromColors(
                  baseColor: getBaseColor(isDark),
                  highlightColor: getHighlightColor(isDark),
                  child: Container(
                    width: 250,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Description line 1
                Shimmer.fromColors(
                  baseColor: getBaseColor(isDark),
                  highlightColor: getHighlightColor(isDark),
                  child: Container(
                    width: double.infinity,
                    height: 14,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Description line 2
                Shimmer.fromColors(
                  baseColor: getBaseColor(isDark),
                  highlightColor: getHighlightColor(isDark),
                  child: Container(
                    width: double.infinity,
                    height: 14,
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Genre tags
                Shimmer.fromColors(
                  baseColor: getBaseColor(isDark),
                  highlightColor: getHighlightColor(isDark),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 70,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 55,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Buttons
                Shimmer.fromColors(
                  baseColor: getBaseColor(isDark),
                  highlightColor: getHighlightColor(isDark),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 120,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Page indicators
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Shimmer.fromColors(
              baseColor: getBaseColor(isDark),
              highlightColor: getHighlightColor(isDark),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Shimmer for Movie Section (Horizontal List)
  static Widget movieSectionShimmer(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: getBaseColor(isDark),
                highlightColor: getHighlightColor(isDark),
                child: Container(
                  width: 180,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: getBaseColor(isDark),
                highlightColor: getHighlightColor(isDark),
                child: Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: movieCardShimmer(isDark),
              );
            },
          ),
        ),
      ],
    );
  }

  // Shimmer for individual Movie Card
  static Widget movieCardShimmer(bool isDark) {
    return Shimmer.fromColors(
      baseColor: getBaseColor(isDark),
      highlightColor: getHighlightColor(isDark),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster shimmer
            Container(
              height: 240,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  // Rating badge position
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      width: 40,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
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