import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/app_language.dart';
import '../../domain/usecases/get_language.dart';
import '../../domain/usecases/save_language.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetLanguage getLanguage;
  final SaveLanguage saveLanguage;

  LanguageBloc({
    required this.getLanguage,
    required this.saveLanguage,
  }) : super(LanguageInitial()) {
    on<LoadLanguageEvent>(_onLoadLanguage);
    on<ChangeLanguageEvent>(_onChangeLanguage);
  }

  Future<void> _onLoadLanguage(
    LoadLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    emit(LanguageLoading());
    try {
      final language = await getLanguage();
      emit(LanguageLoaded(language));
    } catch (e) {
      emit(LanguageError(e.toString()));
      emit(const LanguageLoaded(AppLanguage.english));
    }
  }

  Future<void> _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    try {
      await saveLanguage(event.language);
      emit(LanguageLoaded(event.language));
    } catch (e) {
      emit(LanguageError(e.toString()));
    }
  }
}