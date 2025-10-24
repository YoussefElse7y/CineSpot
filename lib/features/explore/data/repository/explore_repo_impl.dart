import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/explore/data/datasource/explore_services.dart';
import 'package:cine_spot/features/explore/data/models/company/company_search_response_model.dart';
import 'package:cine_spot/features/explore/data/models/movie/movie_search_response_model.dart';
import 'package:cine_spot/features/explore/data/models/person/person_search_response_model.dart';
import 'package:cine_spot/features/explore/data/models/multi/search_response_model.dart';
import 'package:cine_spot/features/explore/data/models/tv_search_response_model.dart';
import 'package:cine_spot/features/explore/domain/repository/explore_repo.dart';
import 'package:dartz/dartz.dart';

class ExploreRepoImpl implements ExploreRepo {
  final ExploreServices _exploreServices;
  ExploreRepoImpl(this._exploreServices);

  /// 🏢 Company Search
  @override
  Future<Either<Failure, CompanySearchResponseModel>> companySearch(
    String query, {
    int? page,
  }) async {
    try {
      final response = await _exploreServices.getCompanySearchResults(query, page: page);
      final model = CompanySearchResponseModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  /// 🎬 Movie Search
  @override
  Future<Either<Failure, MovieSearchResponseModel>> movieSearch(
    String query, {
    int? page,
    String? language,
    String? primaryReleaseYear,
    String? region,
    String? year,
  }) async {
    try {
      final response = await _exploreServices.getMoviesSearchResults(
        query,
        page: page,
        language: language,
        primaryReleaseYear: primaryReleaseYear,
        region: region,
        year: year,
      );
      final model = MovieSearchResponseModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  /// 👤 Person Search
  @override
  Future<Either<Failure, PersonSearchResponseModel>> personSearch(
    String query, {
    String? language,
    int? page,
  }) async {
    try {
      final response = await _exploreServices.getPersonSearchResults(
        query,
        language: language,
        page: page,
      );
      final model = PersonSearchResponseModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  /// 📺 TV Search
  @override
  Future<Either<Failure, TvSearchResponseModel>> tvSearch(
    String query, {
    int? page,
    String? firstAirDateYear,
    int? year,
    String? language,
  }) async {
    try {
      final response = await _exploreServices.getTvSearchResults(
        query,
        page: page,
        firstAirDateYear: firstAirDateYear,
        year: year,
        language: language,
      );
      final model = TvSearchResponseModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }

  /// 🔍 Multi Search
  @override
  Future<Either<Failure, SearchResponseModel>> multiSearch(
    String query,
    {
    String? language,
    int? page,
  }) async {
    try {
      final response = await _exploreServices.getMultiSearchResults(
        query,
        language: language,
        page: page,
      );
      final model = SearchResponseModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(Failure.serverFailure(e.toString()));
    }
  }
}
