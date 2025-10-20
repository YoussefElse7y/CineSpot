import 'package:cine_spot/features/auth/domain/entities/failure.dart';
import 'package:cine_spot/features/home/data/datasource/remote_home_services.dart';
import 'package:cine_spot/features/home/data/models/movies_response_entity.dart';
import 'package:cine_spot/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final RemoteHomeServices _remoteHomeServices;

  HomeRepoImpl(this._remoteHomeServices);

  @override
  Future<Either<Failure, MoviesResponseModel>> getTopTenMoviesThisWeek(
    String language,
  ) async {
    try {
      final response = await _remoteHomeServices.getTopTenMoviesThisWeek(
        language,
      );
      MoviesResponseModel moviesResponseModel =
          MoviesResponseModel.fromJson(response.data);
      return Right(moviesResponseModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
