import 'package:cine_spot/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'explore_services.g.dart';

@RestApi()
abstract class ExploreServices {
  factory ExploreServices(Dio dio, {String baseUrl}) = _ExploreServices;

  /// 🔍 Multi Search (Movies, TV, People, etc.)
  @GET(ApiConstants.multiSearch)
  Future<HttpResponse<dynamic>> getMultiSearchResults(
    @Query("query") String query, {
    @Query("page") int? page,
    @Query("language") String? language,
  });

  /// 🎬 Movie Search
  @GET(ApiConstants.moviesSearch)
  Future<HttpResponse<dynamic>> getMoviesSearchResults(
    @Query("query") String query, {
    @Query("page") int? page,
    @Query("language") String? language,
    @Query("primary_release_year") String? primaryReleaseYear,
    @Query("region") String? region,
    @Query("year") String? year,
  });

  /// 🏢 Company Search
  @GET(ApiConstants.companySearch)
  Future<HttpResponse<dynamic>> getCompanySearchResults(
    @Query("query") String query, {
    @Query("page") int? page,
  });

  /// 👤 Person Search
  @GET(ApiConstants.personSearch)
  Future<HttpResponse<dynamic>> getPersonSearchResults(
    @Query("query") String query, {
    @Query("page") int? page,
    @Query("language") String? language,
  });

  /// 📺 TV Search
  @GET(ApiConstants.tvShowsSearch)
  Future<HttpResponse<dynamic>> getTvSearchResults(
    @Query("query") String query, {
    @Query("page") int? page,
    @Query("first_air_date_year") String? firstAirDateYear,
    @Query("year") int? year,
    @Query("language") String? language,
  });
}
