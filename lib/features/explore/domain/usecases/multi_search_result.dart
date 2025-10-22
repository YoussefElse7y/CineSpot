import 'package:cine_spot/features/auth/domain/entities/failure.dart';
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
      query: query,
      page: page,
      language: language,
    );
  }
}
