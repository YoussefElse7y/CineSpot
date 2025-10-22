import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/explore/domain/entities/tv_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/repository/explore_repo.dart';
import 'package:dartz/dartz.dart';

class TvSearchResultUseCase {
  final ExploreRepo repository;
  TvSearchResultUseCase(this.repository);

  Future<Either<Failure, TvSearchResponseEntity>> call(
    String query, {
    int? page,
    String? firstAirDateYear,
    int? year,
    String? language,
  }) async {
    return await repository.tvSearch(
      query,
      page: page,
      firstAirDateYear: firstAirDateYear,
      year: year,
      language: language,
    );
  }
}
