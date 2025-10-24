// ignore_for_file: avoid_print

import 'package:cine_spot/core/helpers/constants.dart';
import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/data/datasources/tv_show_services.dart';
import 'package:cine_spot/features/tv_show/data/models/episode/tv_episode_credits_model.dart';
import 'package:cine_spot/features/tv_show/data/models/episode/tv_episode_details_model.dart';
import 'package:cine_spot/features/tv_show/data/models/episode/tv_episode_videos_model.dart';
import 'package:cine_spot/features/tv_show/data/models/season/tv_season_credits_model.dart';
import 'package:cine_spot/features/tv_show/data/models/season/tv_season_details_model.dart';
import 'package:cine_spot/features/tv_show/data/models/season/tv_season_videos_model.dart';
import 'package:cine_spot/features/tv_show/data/models/tv_show/tv_show_credits_model.dart';
import 'package:cine_spot/features/tv_show/data/models/tv_show/tv_show_details_model.dart';
import 'package:cine_spot/features/tv_show/data/models/tv_show/tv_show_recommendations_model.dart';
import 'package:cine_spot/features/tv_show/data/models/tv_show/tv_show_review_model.dart';
import 'package:cine_spot/features/tv_show/data/models/tv_show/tv_show_videos_model.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_credits_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_details_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_videos_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_season_credits_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_season_details_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_season_videos_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_credits_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_details_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_recommendations_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_review_entity.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_videos_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final TvShowServices _tvShowServices;

  TvShowRepositoryImpl(this._tvShowServices);

  // ===========================================================
  // ✅ TV EPISODES
  // ===========================================================

  /// Fetches the credits for a specific TV episode.
  /// [seriesId] The ID of the TV series.
  /// [seasonNumber] The season number.
  /// [episodeNumber] The episode number.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a [TvEpisodeCreditsEntity] or a [Failure].
  @override
  Future<Either<Failure, TvEpisodeCreditsEntity>> getEpisodeCredits(
    int seriesId,
    int seasonNumber,
    int episodeNumber, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getEpisodeCredits(
        seriesId,
        seasonNumber,
        episodeNumber,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final result = TvEpisodeCreditsModel.fromJson(response.data);
      return Right(result.toEntity());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('Episode not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getEpisodeCredits: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getEpisodeCredits: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  /// Fetches the details for a specific TV episode.
  /// [seriesId] The ID of the TV series.
  /// [seasonNumber] The season number.
  /// [episodeNumber] The episode number.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a [TvEpisodeDetailsEntity] or a [Failure].
  @override
  Future<Either<Failure, TvEpisodeDetailsEntity>> getEpisodeDetails(
    int seriesId,
    int seasonNumber,
    int episodeNumber, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getEpisodeDetails(
        seriesId,
        seasonNumber,
        episodeNumber,
        language: language ?? defaultLanguage,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final result = TvEpisodeDetailsModel.fromJson(response.data);
      return Right(result.toEntity());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('Episode not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getEpisodeDetails: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getEpisodeDetails: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  /// Fetches the videos for a specific TV episode.
  /// [seriesId] The ID of the TV series.
  /// [seasonNumber] The season number.
  /// [episodeNumber] The episode number.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a list of [TvEpisodeVideoItemEntity] or a [Failure].
  @override
  Future<Either<Failure, List<TvEpisodeVideoItemEntity>>> getEpisodeVideos(
    int seriesId,
    int seasonNumber,
    int episodeNumber, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getEpisodeVideos(
        seriesId,
        seasonNumber,
        episodeNumber,
        language: language ?? defaultLanguage,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final data = TvEpisodeVideosModel.fromJson(response.data);
      final results = (data.results).map((item) => item.toEntity()).toList();
      return Right(results);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('Episode videos not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getEpisodeVideos: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getEpisodeVideos: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  // ===========================================================
  // ✅ TV SEASONS
  // ===========================================================

  /// Fetches the credits for a specific TV season.
  /// [seriesId] The ID of the TV series.
  /// [seasonNumber] The season number.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a [TvSeasonCreditsEntity] or a [Failure].
  @override
  Future<Either<Failure, TvSeasonCreditsEntity>> getSeasonCredits(
    int seriesId,
    int seasonNumber, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getSeasonCredits(
        seriesId,
        seasonNumber,
        language: language ?? defaultLanguage,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final result = TvSeasonCreditsModel.fromJson(response.data);
      return Right(result.toEntity());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('Season credits not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getSeasonCredits: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getSeasonCredits: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  /// Fetches the details for a specific TV season.
  /// [seriesId] The ID of the TV series.
  /// [seasonNumber] The season number.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a [TvSeasonDetailsEntity] or a [Failure].
  @override
  Future<Either<Failure, TvSeasonDetailsEntity>> getSeasonDetails(
    int seriesId,
    int seasonNumber, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getSeasonDetails(
        seriesId,
        seasonNumber,
        language: language ?? defaultLanguage,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final result = TvSeasonDetailsModel.fromJson(response.data);
      return Right(result.toEntity());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('Season details not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getSeasonDetails: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getSeasonDetails: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  /// Fetches the videos for a specific TV season.
  /// [seriesId] The ID of the TV series.
  /// [seasonNumber] The season number.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a list of [TvSeasonVideoItemEntity] or a [Failure].
  @override
  Future<Either<Failure, List<TvSeasonVideoItemEntity>>> getSeasonVideos(
    int seriesId,
    int seasonNumber, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getSeasonVideos(
        seriesId,
        seasonNumber,
        language: language ?? defaultLanguage,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final model = TvSeasonVideosModel.fromJson(response.data);
      final results = model.results;
      return Right(results);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('Season videos not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getSeasonVideos: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getSeasonVideos: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  // ===========================================================
  // ✅ TV SHOW
  // ===========================================================

  /// Fetches the details for a specific TV show.
  /// [seriesId] The ID of the TV series.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a [TvShowDetailsEntity] or a [Failure].
  @override
  Future<Either<Failure, TvShowDetailsEntity>> getTvShowDetails(
    int seriesId, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getTvShowDetails(
        seriesId,
        language: language ?? defaultLanguage,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final result = TvShowDetailsModel.fromJson(response.data);
      return Right(result.toEntity());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('TV show not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getTvShowDetails: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getTvShowDetails: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  /// Fetches recommendations for a specific TV show.
  /// [seriesId] The ID of the TV series.
  /// [language] The language for the API request (defaults to 'en-US').
  /// [page] The page number for paginated results (defaults to 1).
  /// Returns an [Either] containing a [TvShowRecommendationsEntity] or a [Failure].
  @override
  Future<Either<Failure, TvShowRecommendationsEntity>> getTvShowRecommendations(
    int seriesId, {
    String? language,
    int page = 1,
  }) async {
    try {
      final response = await _tvShowServices.getTvShowRecommendations(
        seriesId,
        language: language ?? defaultLanguage,
        page: page,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final result = TvShowRecommendationsModel.fromJson(response.data);
      return Right(result.toEntity());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('Recommendations not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getTvShowRecommendations: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getTvShowRecommendations: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  /// Fetches the credits for a specific TV show.
  /// [seriesId] The ID of the TV series.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a [TvShowCreditsEntity] or a [Failure].
  @override
  Future<Either<Failure, TvShowCreditsEntity>> getTvShowCredits(
    int seriesId, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getTvShowCredits(
        seriesId,
        language: language ?? defaultLanguage,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final result = TvShowCreditsModel.fromJson(response.data);
      return Right(result.toEntity());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('TV show credits not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getTvShowCredits: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getTvShowCredits: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  /// Fetches the videos for a specific TV show.
  /// [seriesId] The ID of the TV series.
  /// [language] The language for the API request (defaults to 'en-US').
  /// Returns an [Either] containing a list of [TvShowVideoResultEntity] or a [Failure].
  @override
  Future<Either<Failure, List<TvShowVideoResultEntity>>> getTvShowVideos(
    int seriesId, {
    String? language,
  }) async {
    try {
      final response = await _tvShowServices.getTvShowVideos(
        seriesId,
        language: language ?? defaultLanguage,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final data = TvShowVideosModel.fromJson(response.data);

      return Right(data.results);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('TV show videos not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getTvShowVideos: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getTvShowVideos: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  /// Fetches the reviews for a specific TV show.
  /// [seriesId] The ID of the TV series.
  /// [language] The language for the API request (defaults to 'en-US').
  /// [page] The page number for paginated results (defaults to 1).
  /// Returns an [Either] containing a [TvShowReviewEntity] or a [Failure].
  @override
  Future<Either<Failure, TvShowReviewEntity>> getTvShowReviews(
    int seriesId, {
    String? language,
    int page = 1,
  }) async {
    try {
      final response = await _tvShowServices.getTvShowReviews(
        seriesId,
        language: language ?? defaultLanguage,
        page: page,
      );
      if (response.data == null) {
        return Left(ServerFailure('No data returned from API'));
      }
      final result = TvShowReviewModel.fromJson(response.data);
      return Right(result.toEntity());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure('Reviews not found'));
      } else if (e.type == DioErrorType.connectionTimeout) {
        return Left(NetworkFailure('Connection timeout'));
      }
      print('Error in getTvShowReviews: $e');
      return Left(ServerFailure('Error: ${e.message}'));
    } catch (e) {
      print('Unexpected error in getTvShowReviews: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
