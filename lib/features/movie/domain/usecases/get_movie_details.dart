
import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_details_entity.dart';
import 'package:cine_spot/features/movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailsUseCase {

  final MovieRepository movieRepository;
  GetMovieDetailsUseCase(this.movieRepository);

  Future<Either<Failure, MovieDetailsEntity>> execute(int movieId ,{String? language}) async {
    return await movieRepository.getMovieDetails(movieId , language: language);
  }
  
}