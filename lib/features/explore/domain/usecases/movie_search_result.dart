import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/repository/explore_repo.dart';
import 'package:dartz/dartz.dart';

class MovieSearchResult {
  ExploreRepo repository;
  MovieSearchResult(this.repository);

  Future<Either<Failure, MovieSearchResponseEntity>> call(
    String query, {
    int? page,
    String? language,
    String? primaryReleaseYear,
    String? region,
    String? year,
  }) async {
    return await repository.movieSearch(
      query,
      language: language,
      page: page,
      primaryReleaseYear: primaryReleaseYear,
      region: region,
      year: year,
    );
  }
}
