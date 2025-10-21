
import 'package:cine_spot/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'remote_home_services.g.dart';


@RestApi()
abstract class RemoteHomeServices {
  factory RemoteHomeServices(Dio dio, {String baseUrl}) =
      _RemoteHomeServices;

  @GET(ApiConstants.topTenMoviesThisWeek)
  Future<HttpResponse<dynamic>> getTopTenMoviesThisWeek(
    @Query("language") String language, 
  );

  @GET(ApiConstants.playingNowMovies)
  Future<HttpResponse<dynamic>> getPlayingNowMovies(
    @Query("language") String language, 
    @Query("page") int page,
  );

  @GET(ApiConstants.trendingTvShows)
  Future<HttpResponse<dynamic>> getTrendingTvShows(
    @Query("language") String language,
  );




  
}