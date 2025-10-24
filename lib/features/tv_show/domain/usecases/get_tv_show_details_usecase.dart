
import 'package:cine_spot/core/failure/failure.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_details_entity.dart';
import 'package:cine_spot/features/tv_show/domain/repository/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvShowDetailsUseCase {
  final TvShowRepository _tvShowRepository;
  GetTvShowDetailsUseCase(this._tvShowRepository);

  Future<Either<Failure,TvShowDetailsEntity>> call(int id,{String? language}) async {
    return await _tvShowRepository.getTvShowDetails(id,language: language);
  }
  
}