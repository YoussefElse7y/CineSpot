
 import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/home/domain/entities/movies_response_entity.dart';
import 'package:cine_spot/features/home/domain/entities/now_playing_movie_response_entity.dart';
import 'package:cine_spot/features/home/domain/entities/trending_tv_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, MoviesResponseEntity>> getTopTenMoviesThisWeek(String language);
  Future<Either<Failure, NowPlayingMoviesResponseEntity>> getNowPlayingMovies(String language , int page);
  Future<Either<Failure,TrendingTvResponseEntity>> getTrendingTv(String language);
  

}