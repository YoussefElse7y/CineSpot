import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/explore/domain/entities/company/company_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/repository/explore_repo.dart';
import 'package:dartz/dartz.dart';

class CompanySearchResultUseCase {
  final ExploreRepo repository;
  CompanySearchResultUseCase(this.repository);

  Future<Either<Failure, CompanySearchResponseEntity>> call(
    String query, {
    int? page,
  }) async {
    return await repository.companySearch(
      query,
      page: page,
    );
  }
}
