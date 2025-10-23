import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/movie/data/datasources/movie_services.dart';
import 'package:cine_spot/features/movie/data/models/credits_model.dart';
import 'package:cine_spot/features/movie/data/models/movie_details_model.dart';
import 'package:cine_spot/features/movie/data/models/movie_review_model.dart';
import 'package:cine_spot/features/movie/data/models/movie_videos_model.dart';
import 'package:cine_spot/features/movie/data/models/recommendations_model.dart';
import 'package:cine_spot/features/movie/data/models/similar_movies_response_model.dart';
import 'package:cine_spot/features/movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieServices _movieServices;

  MovieRepositoryImpl(this._movieServices);

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
    int movieId, {
    String? language,
  }) async {
    try {
      final response = await _movieServices.getMovieDetails(
        movieId,
        language: language ?? 'en-US',
      );
      final data = MovieDetailsModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreditsModel>> getCredits(
    int movieId, {
    String? language,
  }) async {
    try {
      final response = await _movieServices.getCredits(
        movieId,
        language: language ?? 'en-US',
      );
      final data = CreditsModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieVideosModel>> getVideos(
    int movieId, {
    String? language,
  }) async {
    try {
      final response = await _movieServices.getVideos(
        movieId,
        language: language ?? 'en-US',
      );
      final data = MovieVideosModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SimilarMoviesResponseModel>> getSimilar(
    int movieId, {
    String? language,
    int? page,
  }) async {
    try {
      final response = await _movieServices.getSimilarMovies(
        movieId,
        language: language ?? 'en-US',
        page: page ?? 1,
      );
      final data = SimilarMoviesResponseModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RecommendationsModel>> getRecommendations(
    int movieId, {
    String? language,
    int? page,
  }) async {
    try {
      final response = await _movieServices.getRecommendations(
        movieId,
        language: language ?? 'en-US',
        page: page ?? 1,
      );
      final data = RecommendationsModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieReviewModel>>> getReviews(
    int movieId, {
    String? language,
    int? page,
  }) async {
    try {
      final response = await _movieServices.getMovieReviews(
        movieId,
        language: language ?? 'en-US',
        page: page ?? 1,
      );
      final data = MovieReviewsResponseModel.fromJson(response.data);
      final reviews = data.results;
      return Right(reviews);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
