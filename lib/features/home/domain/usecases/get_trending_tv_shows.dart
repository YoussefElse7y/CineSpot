import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/home/domain/entities/trending_tv_response_entity.dart';
import 'package:cine_spot/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetTrendingTvShowsUseCase {
  final HomeRepo repository;
  GetTrendingTvShowsUseCase({required this.repository});

  Future<Either<Failure, TrendingTvResponseEntity>> call(
    String language,
  ) async {
    return await repository.getTrendingTv(language);
  }
}
