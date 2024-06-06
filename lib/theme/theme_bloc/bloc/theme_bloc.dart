import 'package:ai_bot/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;

  ThemeBloc({required this.themeRepository}) : super(ThemeState.initial()) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final isDarkMode = await themeRepository.isDarkMode();
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  Future<void> _onToggleTheme(
      ToggleTheme event, Emitter<ThemeState> emit) async {
    final newIsDarkMode = !state.isDarkMode;
    await themeRepository.setDarkMode(newIsDarkMode);
    emit(state.copyWith(isDarkMode: newIsDarkMode));
  }
}
