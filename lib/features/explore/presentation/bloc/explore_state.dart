import 'package:cine_spot/features/home/domain/entities/trending_tv_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cine_spot/features/explore/domain/entities/multi/search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/tv_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/person/person_search_response_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/company/company_search_response_entity.dart';

part 'explore_state.freezed.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState.initial({
    required TrendingTvResponseEntity trendingTv,
  }) = ExploreInitial;
  
  const factory ExploreState.loading() = ExploreLoading;
  
  const factory ExploreState.multiSearchLoaded({
    required SearchResponseEntity searchResponse,
  }) = MultiSearchLoaded;
  
  const factory ExploreState.movieSearchLoaded({
    required MovieSearchResponseEntity movieSearchResponse,
  }) = MovieSearchLoaded;
  
  const factory ExploreState.tvShowSearchLoaded({
    required TvSearchResponseEntity tvSearchResponse,
  }) = TvShowSearchLoaded;
  
  const factory ExploreState.personSearchLoaded({
    required PersonSearchResponseEntity personSearchResponse,
  }) = PersonSearchLoaded;
  
  const factory ExploreState.companySearchLoaded({
    required CompanySearchResponseEntity companySearchResponse,
  }) = CompanySearchLoaded;
  
  const factory ExploreState.error({
    required String message,
  }) = ExploreError;
}