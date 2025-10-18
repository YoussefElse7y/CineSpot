import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/app_theme_mode.dart';
import '../../domain/usecases/get_theme_mode.dart';
import '../../domain/usecases/save_theme_mode.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeMode getThemeMode;
  final SaveThemeMode saveThemeMode;

  ThemeBloc({
    required this.getThemeMode,
    required this.saveThemeMode,
  }) : super(ThemeInitial()) {
    on<LoadThemeEvent>(_onLoadTheme);
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  Future<void> _onLoadTheme(
    LoadThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ThemeLoading());
    try {
      final themeMode = await getThemeMode();
      emit(ThemeLoaded(themeMode));
    } catch (e) {
      emit(ThemeError(e.toString()));
      // Fallback to system theme
      emit(const ThemeLoaded(AppThemeMode.system));
    }
  }

  Future<void> _onChangeTheme(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      await saveThemeMode(event.themeMode);
      emit(ThemeLoaded(event.themeMode));
    } catch (e) {
      emit(ThemeError(e.toString()));
    }
  }
}