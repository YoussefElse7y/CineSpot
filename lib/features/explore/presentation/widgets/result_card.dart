import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_result_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/multi/search_result_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/person/person_search_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/tv_search_response_entity.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final dynamic result;

  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    if (result is SearchResultEntity) {
      return GestureDetector(
        onTap: () {
          if (result.mediaType == 'movie') {
            Navigator.pushNamed(
              context,
              Routes.movieDetailsScreen,
              arguments: result.id,
            );
          }
        },
        child: _buildMultiSearchCard(result),
      );
    } else if (result is MovieSearchResultEntity) {
      return GestureDetector(onTap: () {
        Navigator.pushNamed(
              context,
              Routes.movieDetailsScreen,
              arguments: result.id,
            );
      }, child: _buildMovieCard(result));
    } else if (result is TvEntity) {
      return _buildTvCard(result);
    } else if (result is PersonSearchEntity) {
      return _buildPersonCard(result);
    }
    return const SizedBox.shrink();
  }

  Widget _buildMultiSearchCard(SearchResultEntity result) {
    if (result.mediaType == 'person') {
      return _buildPersonType(result.profilePath, result.name ?? 'Unknown');
    }
    return _buildMediaCard(
      result.posterPath,
      result.voteAverage,
      result.title ?? result.name ?? 'Unknown',
    );
  }

  Widget _buildMovieCard(MovieSearchResultEntity result) {
    return _buildMediaCard(result.posterPath, result.voteAverage, result.title);
  }

  Widget _buildTvCard(TvEntity result) {
    return _buildMediaCard(result.posterPath, result.voteAverage, result.name);
  }

  Widget _buildPersonCard(PersonSearchEntity result) {
    return _buildPersonType(result.profilePath, result.name);
  }

  Widget _buildMediaCard(String? posterPath, double rating, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          if (posterPath != null)
            Image.network(
              TMDBImageHelper.getPoster(posterPath, PosterSize.w500),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[800],
                child: const Icon(Icons.movie, size: 50, color: Colors.white54),
              ),
            )
          else
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[800],
              child: const Icon(Icons.movie, size: 50, color: Colors.white54),
            ),
          if (rating > 0)
            Positioned(
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
            ),
          Positioned(
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
          ),
        ],
      ),
    );
  }

  Widget _buildPersonType(String? profilePath, String name) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          if (profilePath != null)
            Image.network(
              TMDBImageHelper.getProfile(profilePath, ProfileSize.h632),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[800],
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white54,
                ),
              ),
            )
          else
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[800],
              child: const Icon(Icons.person, size: 50, color: Colors.white54),
            ),
          Positioned(
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
          ),
        ],
      ),
    );
  }
}
