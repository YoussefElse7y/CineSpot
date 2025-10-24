import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/explore/domain/entities/company/company_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/person/person_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/multi/search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/tv_search_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepo {
  Future<Either<Failure, SearchResponseEntity>> multiSearch(
     String query,
    {
    String? language,
    int? page,
  });
  Future<Either<Failure, CompanySearchResponseEntity>> companySearch(
    String query, {
    int? page,
  });
  Future<Either<Failure, MovieSearchResponseEntity>> movieSearch(
    String query, {
    int? page,
    String? language,
    String? primaryReleaseYear,
    String? region,
    String? year,
  });
  Future<Either<Failure, PersonSearchResponseEntity>> personSearch(
    String query, {
    String? language,
    int? page,
  });
  Future<Either<Failure, TvSearchResponseEntity>> tvSearch(
    String query, {
    int? page,
    String? firstAirDateYear,
    int? year,
    String? language,
  });
}
