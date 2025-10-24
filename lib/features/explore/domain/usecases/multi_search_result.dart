import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/explore/domain/entities/multi/search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/repository/explore_repo.dart';
import 'package:dartz/dartz.dart';

class MultiSearchResultUseCase {
  ExploreRepo repository;
  MultiSearchResultUseCase(this.repository);

  Future<Either<Failure, SearchResponseEntity>> call(
    String query, {
    int? page,
    String? language,
  }) async {
    return await repository.multiSearch(
      query,
      page: page,
      language: language,
    );
  }
}
