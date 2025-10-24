import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'tv_show_services.g.dart';

@RestApi()
abstract class TvShowServices {
  factory TvShowServices(Dio dio, {String baseUrl}) = _TvShowServices;

  // ✅ Get TV Show Details
  @GET("/tv/{series_id}")
  Future<HttpResponse<dynamic>> getTvShowDetails(
    @Path("series_id") int seriesId, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get TV Show Recommendations
  @GET("/tv/{series_id}/recommendations")
  Future<HttpResponse<dynamic>> getTvShowRecommendations(
    @Path("series_id") int seriesId, {
    @Query("language") String language = 'en-US',
    @Query("page") int page = 1,
  });

  // ✅ Get TV Show Credits
  @GET("/tv/{series_id}/aggregate_credits")
  Future<HttpResponse<dynamic>> getTvShowCredits(
    @Path("series_id") int seriesId, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get TV Show Videos
  @GET("/tv/{series_id}/videos")
  Future<HttpResponse<dynamic>> getTvShowVideos(
    @Path("series_id") int seriesId, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get TV Show Reviews
  @GET("/tv/{series_id}/reviews")
  Future<HttpResponse<dynamic>> getTvShowReviews(
    @Path("series_id") int seriesId, {
    @Query("language") String language = 'en-US',
    @Query("page") int page = 1,
  });

  // ===========================================================
  // ✅ TV SEASONS
  // ===========================================================

  // ✅ Get Season Details
  @GET("/tv/{series_id}/season/{season_number}")
  Future<HttpResponse<dynamic>> getSeasonDetails(
    @Path("series_id") int seriesId,
    @Path("season_number") int seasonNumber, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get Season Videos
  @GET("/tv/{series_id}/season/{season_number}/videos")
  Future<HttpResponse<dynamic>> getSeasonVideos(
    @Path("series_id") int seriesId,
    @Path("season_number") int seasonNumber, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get Season Credits
  @GET("/tv/{series_id}/season/{season_number}/credits")
  Future<HttpResponse<dynamic>> getSeasonCredits(
    @Path("series_id") int seriesId,
    @Path("season_number") int seasonNumber, {
    @Query("language") String language = 'en-US',
  });

  // ===========================================================
  // ✅ TV EPISODES
  // ===========================================================

  // ✅ Get Episode Details
  @GET("/tv/{series_id}/season/{season_number}/episode/{episode_number}")
  Future<HttpResponse<dynamic>> getEpisodeDetails(
    @Path("series_id") int seriesId,
    @Path("season_number") int seasonNumber,
    @Path("episode_number") int episodeNumber, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get Episode Videos
  @GET("/tv/{series_id}/season/{season_number}/episode/{episode_number}/videos")
  Future<HttpResponse<dynamic>> getEpisodeVideos(
    @Path("series_id") int seriesId,
    @Path("season_number") int seasonNumber,
    @Path("episode_number") int episodeNumber, {
    @Query("language") String language = 'en-US',
  });

  // ✅ Get Episode Credits
  @GET("/tv/{series_id}/season/{season_number}/episode/{episode_number}/credits")
  Future<HttpResponse<dynamic>> getEpisodeCredits(
    @Path("series_id") int seriesId,
    @Path("season_number") int seasonNumber,
    @Path("episode_number") int episodeNumber, {
    @Query("language") String language = 'en-US',
  });
}
