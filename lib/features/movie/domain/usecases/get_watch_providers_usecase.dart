
import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_watch_providers_entity.dart';
import 'package:cine_spot/features/movie/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetWatchProvidersUseCase {
  final MovieRepository repository;

  GetWatchProvidersUseCase(this.repository);

  Future<Either<Failure, MovieWatchProvidersEntity>> call(int movieId) {
    return repository.getWatchProviders(movieId);
  }
  
}