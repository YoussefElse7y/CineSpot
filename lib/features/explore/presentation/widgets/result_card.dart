import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/widgets/image.dart';
import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_result_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/multi/search_result_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/person/person_search_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/tv_search_response_entity.dart';
import 'package:flutter/material.dart';

/// A responsive card widget that renders different layouts (movie, TV, person)
/// depending on the provided search result type and handles navigation on tap.
///
/// Accepted result runtime types:
/// - SearchResultEntity (multi-search: movie | tv | person)
/// - MovieSearchResultEntity (movie-only search)
/// - TvEntity (tv-only search)
/// - PersonSearchEntity (people search)
class ResultCard extends StatelessWidget {
  /// Backing model for the card. This is dynamic by design because this widget
  /// is shared across multiple search result flows (multi/movie/tv/person).
  final dynamic result;

  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    // Theme snapshot used to choose placeholder/background colors appropriately.
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Multi-search branch (movie | tv | person) using mediaType discriminator.
    if (result is SearchResultEntity) {
      return _MultiSearchCardWrapper(result: result, isDark: isDark);
    } else if (result is MovieSearchResultEntity) {
      // Movie-only search results route directly to movie details.
      return _MovieCardWrapper(result: result, isDark: isDark);
    } else if (result is TvEntity) {
      // TV-only search results route directly to TV details.
      return _TvCardWrapper(result: result, isDark: isDark);
    } else if (result is PersonSearchEntity) {
      // Person search shows a non-tappable card (no navigation provided).
      return _PersonCardWrapper(result: result, isDark: isDark);
    }

    // Safety fallback in case an unsupported type is passed.
    return const SizedBox.shrink();
  }
}

/// Wrapper for multi-search results. Delegates to media or person card
/// depending on mediaType and handles navigation.
class _MultiSearchCardWrapper extends StatelessWidget {
  final SearchResultEntity result;
  final bool isDark;

  const _MultiSearchCardWrapper({
    required this.result,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to details based on mediaType for multi-search results.
        if (result.mediaType == 'movie') {
          Navigator.pushNamed(
            context,
            Routes.movieDetailsScreen,
            arguments: result.id,
          );
        }
        if (result.mediaType == 'tv') {
          Navigator.pushNamed(
            context,
            Routes.tvShowDetailsScreen,
            arguments: result.id,
          );
        }
        // Note: mediaType == 'person' intentionally has no navigation here.
      },
      child: result.mediaType == 'person'
          ? _PersonCard(
              profilePath: result.profilePath,
              name: result.name ?? 'Unknown',
              isDark: isDark,
            )
          : _MediaCard(
              posterPath: result.posterPath,
              rating: result.voteAverage,
              title: result.title ?? result.name ?? 'Unknown',
              isDark: isDark,
            ),
    );
  }
}

/// Wrapper for movie-only search results with navigation to movie details.
class _MovieCardWrapper extends StatelessWidget {
  final MovieSearchResultEntity result;
  final bool isDark;

  const _MovieCardWrapper({
    required this.result,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.movieDetailsScreen,
          arguments: result.id,
        );
      },
      child: _MediaCard(
        posterPath: result.posterPath,
        rating: result.voteAverage,
        title: result.title,
        isDark: isDark,
      ),
    );
  }
}

/// Wrapper for TV-only search results with navigation to TV details.
class _TvCardWrapper extends StatelessWidget {
  final TvEntity result;
  final bool isDark;

  const _TvCardWrapper({
    required this.result,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.tvShowDetailsScreen,
          arguments: result.id,
        );
      },
      child: _MediaCard(
        posterPath: result.posterPath,
        rating: result.voteAverage,
        title: result.name,
        isDark: isDark,
      ),
    );
  }
}

/// Wrapper for person search results. Non-tappable (no navigation provided).
class _PersonCardWrapper extends StatelessWidget {
  final PersonSearchEntity result;
  final bool isDark;

  const _PersonCardWrapper({
    required this.result,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return _PersonCard(
      profilePath: result.profilePath,
      name: result.name,
      isDark: isDark,
    );
  }
}

/// Shared media (movie/TV) card widget.
///
/// Displays a poster image with optional rating badge and title overlay.
/// - posterPath: TMDB poster path, may be null (renders placeholder if null)
/// - rating: vote average in the 0..10 range. If <= 0, badge is hidden.
/// - title: display title under gradient overlay.
/// - isDark: current theme brightness flag for placeholder tones.
class _MediaCard extends StatelessWidget {
  final String? posterPath;
  final double rating;
  final String title;
  final bool isDark;

  const _MediaCard({
    required this.posterPath,
    required this.rating,
    required this.title,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // Poster (or placeholder if missing)
          _PosterImage(
            posterPath: posterPath,
            isDark: isDark,
          ),

          // Rating badge (hidden when rating <= 0)
          if (rating > 0)
            _RatingBadge(rating: rating),

          // Title with bottom gradient for readability.
          _TitleOverlay(title: title),
        ],
      ),
    );
  }
}

/// Displays the poster image or a placeholder icon.
class _PosterImage extends StatelessWidget {
  final String? posterPath;
  final bool isDark;

  const _PosterImage({
    required this.posterPath,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    if (posterPath != null) {
      return displayImage(
        imageUrl: TMDBImageHelper.getPoster(posterPath!, PosterSize.w500),
        context: context,
        isDark: isDark,
        width: double.infinity,
        height: double.infinity,
        errorIcon: const Icon(
          Icons.movie,
          size: 50,
          color: Colors.white54,
        ),
      );
    }

    return Container(
      width: 160,
      height: 240,
      color: isDark ? Colors.grey[800] : Colors.grey[300],
      child: const Icon(Icons.movie, size: 50, color: Colors.white54),
    );
  }
}

/// Displays a rating badge in the top-left corner.
class _RatingBadge extends StatelessWidget {
  final double rating;

  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFE21221),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/// Displays title text with a bottom gradient overlay for readability.
class _TitleOverlay extends StatelessWidget {
  final String title;

  const _TitleOverlay({required this.title});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

/// Person card widget. Shows profile image or placeholder and a centered name.
class _PersonCard extends StatelessWidget {
  final String? profilePath;
  final String name;
  final bool isDark;

  const _PersonCard({
    required this.profilePath,
    required this.name,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // Profile image (or placeholder if missing)
          _ProfileImage(
            profilePath: profilePath,
            isDark: isDark,
          ),

          // Name with bottom gradient for readability.
          _NameOverlay(name: name),
        ],
      ),
    );
  }
}

/// Displays the profile image or a placeholder icon.
class _ProfileImage extends StatelessWidget {
  final String? profilePath;
  final bool isDark;

  const _ProfileImage({
    required this.profilePath,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    if (profilePath != null) {
      return displayImage(
        imageUrl: TMDBImageHelper.getProfile(
          profilePath!,
          ProfileSize.h632,
        ),
        width: double.infinity,
        height: double.infinity,
        errorIcon: const Icon(
          Icons.person,
          size: 50,
          color: Colors.white54,
        ),
        context: context,
        isDark: isDark,
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[800],
      child: const Icon(Icons.person, size: 50, color: Colors.white54),
    );
  }
}

/// Displays person name with a bottom gradient overlay for readability.
class _NameOverlay extends StatelessWidget {
  final String name;

  const _NameOverlay({required this.name});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
