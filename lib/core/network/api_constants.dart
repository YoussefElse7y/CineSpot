class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static final String apiKey = '1e76990461e066e1cea80c75ee7e5f1b';
  static const String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZTc2OTkwNDYxZTA2NmUxY2VhODBjNzVlZTdlNWYxYiIsIm5iZiI6MTc1NDA3NjExOC4yOTYsInN1YiI6IjY4OGQxM2Q2MjgyYjhjYjUwZGIyMjQzZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ovMqQkdC_-PiGjcvDcrY9LU1PE6PE3ceh63wKTJvAXo';
  static const String topTenMoviesThisWeek = "trending/movie/week";
  static const String playingNowMovies = "movie/now_playing";
  static const String trendingTvShows = "trending/tv/week";



}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
