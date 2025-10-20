import 'package:cine_spot/features/home/domain/entities/movies_response_entity.dart';
import 'package:cine_spot/features/home/domain/usecases/get_top_ten_movies_tihs_week.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTopTenMoviesTihsWeekUseCase _getTopTenMoviesTihsWeekUseCase;
  HomeBloc(this._getTopTenMoviesTihsWeekUseCase) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        getTopTenMovies: (language) => _onGetTopTenMovies(language, emit),
      );
    });
  }

  Future<void> _onGetTopTenMovies(
    String language,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.topMoviesLoading());
    final result = await _getTopTenMoviesTihsWeekUseCase.call(language);
    result.fold(
      (failure) {
        emit(HomeState.topMoviesError(failure.message));
      },
      (moviesResponse) {
        emit(HomeState.topMoviesLoaded(moviesResponse));
      },
    );
  }
}
