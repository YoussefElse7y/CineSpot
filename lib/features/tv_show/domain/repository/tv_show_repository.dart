
import 'package:cine_spot/core/failure/failure.dart';
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
import 'package:dartz/dartz.dart';

abstract class TvShowRepository {
  Future<Either<Failure,TvShowDetailsEntity>> getTvShowDetails(int seriesId,{String? language});
  Future<Either<Failure,TvShowRecommendationsEntity>> getTvShowRecommendations(int seriesId,{String? language ,int page = 1});
  Future<Either<Failure,TvShowCreditsEntity>> getTvShowCredits(int seriesId,{String? language});
  Future<Either<Failure,List<TvShowVideoResultEntity>>> getTvShowVideos(int seriesId,{String? language});
  Future<Either<Failure,TvShowReviewEntity>> getTvShowReviews(int seriesId,{String? language,int page = 1});

  // Season
  Future<Either<Failure,TvSeasonDetailsEntity>> getSeasonDetails(int seriesId,int seasonNumber,{String? language});
  Future<Either<Failure,List<TvSeasonVideoItemEntity>>> getSeasonVideos(int seriesId,int seasonNumber,{String? language});
  Future<Either<Failure,TvSeasonCreditsEntity>> getSeasonCredits(int seriesId,int seasonNumber,{String? language});

  // Episode
  Future<Either<Failure,TvEpisodeDetailsEntity>> getEpisodeDetails(int seriesId,int seasonNumber,int episodeNumber,{String? language});  
  Future<Either<Failure,List<TvEpisodeVideoItemEntity>>> getEpisodeVideos(int seriesId,int seasonNumber,int episodeNumber,{String? language});
  Future<Either<Failure,TvEpisodeCreditsEntity>> getEpisodeCredits(int seriesId,int seasonNumber,int episodeNumber,{String? language});
  


}

