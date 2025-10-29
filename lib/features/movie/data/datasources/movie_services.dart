import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'movie_services.g.dart';

@RestApi()
abstract class MovieServices {
  factory MovieServices(Dio dio, {String baseUrl}) = _MovieServices;

  // ✅ Get Movie Details
  @GET("/movie/{movie_id}")
  Future<HttpResponse<dynamic>> getMovieDetails(
    @Path("movie_id") int movieId, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get Credits (Cast & Crew)
  @GET("/movie/{movie_id}/credits")
  Future<HttpResponse<dynamic>> getCredits(
    @Path("movie_id") int movieId, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get Videos (Trailers, Clips, etc.)
  @GET("/movie/{movie_id}/videos")
  Future<HttpResponse<dynamic>> getVideos(
    @Path("movie_id") int movieId, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get Similar Movies
  @GET("/movie/{movie_id}/similar")
  Future<HttpResponse<dynamic>> getSimilarMovies(
    @Path("movie_id") int movieId, {
    @Query("language") String language = 'en-US',
    @Query("page") int page = 1,
  });

  // ✅ Get Recommendations
  @GET("/movie/{movie_id}/recommendations")
  Future<HttpResponse<dynamic>> getRecommendations(
    @Path("movie_id") int movieId, {
    @Query("language") String language = 'en-US',
    @Query("page") int page = 1,
  });

  // ✅ Get Reviews
  @GET("/movie/{movie_id}/reviews")
  Future<HttpResponse<dynamic>> getMovieReviews(
    @Path("movie_id") int movieId, {
    @Query("language") String language = 'en-US',
    @Query("page") int page = 1,
  });

  // ✅ Get Watch Providers
  @GET("/movie/{movie_id}/watch/providers")
  Future<HttpResponse<dynamic>> getWatchProviders(
    @Path("movie_id") int movieId,
  );
}
