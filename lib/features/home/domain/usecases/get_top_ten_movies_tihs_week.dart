import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/home/domain/entities/movies_response_entity.dart';
import 'package:cine_spot/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetTopTenMoviesTihsWeekUseCase {
  final HomeRepo homeRepo;
  GetTopTenMoviesTihsWeekUseCase({required this.homeRepo});

  Future<Either<Failure,MoviesResponseEntity>> call(String language) async {
    return homeRepo.getTopTenMoviesThisWeek(language);
  }
}
