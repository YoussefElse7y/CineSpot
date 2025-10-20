
 import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/home/domain/entities/movies_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, MoviesResponseEntity>> getTopTenMoviesThisWeek(String language);
}