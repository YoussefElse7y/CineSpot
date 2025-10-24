
import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/movie/domain/entities/credits_entity.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_details_entity.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_review_entity.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_videos_entity.dart';
import 'package:cine_spot/features/movie/domain/entities/recommendations_entity.dart';
import 'package:cine_spot/features/movie/domain/entities/similar_movies_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class  MovieRepository {
  Future<Either<Failure,MovieDetailsEntity>> getMovieDetails(int movieId ,{String? language});
  Future<Either<Failure,CreditsEntity>> getCredits(int movieId, {String? language});
  Future<Either<Failure,MovieVideosEntity>> getVideos(int movieId, {String? language});
  Future<Either<Failure,SimilarMoviesResponseEntity>> getSimilar(int movieId, {String? language ,int? page});
  Future<Either<Failure,RecommendationsEntity>> getRecommendations (int movieId, {String? language ,int? page});
  Future<Either<Failure,List<MovieReviewEntity>>> getReviews (int movieId, {String? language ,int? page});

}