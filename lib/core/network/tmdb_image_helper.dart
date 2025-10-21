enum PosterSize { w92, w154, w185, w342, w500, w780, original }
enum BackdropSize { w300, w780, w1280, original }
enum LogoSize { w45, w92, w154, w185, w300, w500, original }
enum ProfileSize { w45, w185, h632, original }
enum StillSize { w92, w185, w300, original }

class TMDBImageHelper {
  static const String _baseUrl = "http://image.tmdb.org/t/p/";
  static const String _secureBaseUrl = "https://image.tmdb.org/t/p/";

  // You can switch between secure and non-secure URLs by toggling this flag
  static const bool useSecure = true;

  static String get _base => useSecure ? _secureBaseUrl : _baseUrl;

  // 🎬 POSTER
  static String getPoster(String posterPath, PosterSize size) {
    switch (size) {
      case PosterSize.w92:
        return '$_base${'w92'}$posterPath';
      case PosterSize.w154:
        return '$_base${'w154'}$posterPath';
      case PosterSize.w185:
        return '$_base${'w185'}$posterPath';
      case PosterSize.w342:
        return '$_base${'w342'}$posterPath';
      case PosterSize.w500:
        return '$_base${'w500'}$posterPath';
      case PosterSize.w780:
        return '$_base${'w780'}$posterPath';
      case PosterSize.original:
        return '$_base${'original'}$posterPath';
    }
  }

  // 🌄 BACKDROP
  static String getBackdrop(String backdropPath, BackdropSize size) {
    switch (size) {
      case BackdropSize.w300:
        return '$_base${'w300'}$backdropPath';
      case BackdropSize.w780:
        return '$_base${'w780'}$backdropPath';
      case BackdropSize.w1280:
        return '$_base${'w1280'}$backdropPath';
      case BackdropSize.original:
        return '$_base${'original'}$backdropPath';
    }
  }

  // 🏷️ LOGO
  static String getLogo(String logoPath, LogoSize size) {
    switch (size) {
      case LogoSize.w45:
        return '$_base${'w45'}$logoPath';
      case LogoSize.w92:
        return '$_base${'w92'}$logoPath';
      case LogoSize.w154:
        return '$_base${'w154'}$logoPath';
      case LogoSize.w185:
        return '$_base${'w185'}$logoPath';
      case LogoSize.w300:
        return '$_base${'w300'}$logoPath';
      case LogoSize.w500:
        return '$_base${'w500'}$logoPath';
      case LogoSize.original:
        return '$_base${'original'}$logoPath';
    }
  }

  // 👤 PROFILE
  static String getProfile(String profilePath, ProfileSize size) {
    switch (size) {
      case ProfileSize.w45:
        return '$_base${'w45'}$profilePath';
      case ProfileSize.w185:
        return '$_base${'w185'}$profilePath';
      case ProfileSize.h632:
        return '$_base${'h632'}$profilePath';
      case ProfileSize.original:
        return '$_base${'original'}$profilePath';
    }
  }

  // 🎞️ STILL
  static String getStill(String stillPath, StillSize size) {
    switch (size) {
      case StillSize.w92:
        return '$_base${'w92'}$stillPath';
      case StillSize.w185:
        return '$_base${'w185'}$stillPath';
      case StillSize.w300:
        return '$_base${'w300'}$stillPath';
      case StillSize.original:
        return '$_base${'original'}$stillPath';
    }
  }
}
