import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/explore/domain/entities/person/person_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/repository/explore_repo.dart';
import 'package:dartz/dartz.dart';

class PersonSearchResultUseCase {
  final ExploreRepo repository;
  PersonSearchResultUseCase(this.repository);

  Future<Either<Failure, PersonSearchResponseEntity>> call(
    String query, {
    String? language,
    int? page,
  }) async {
    return await repository.personSearch(
      query,
      language: language,
      page: page,
    );
  }
}
