part of './theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});

  factory ThemeState.initial() => const ThemeState(isDarkMode: false);

  ThemeState copyWith({required bool isDarkMode}) {
    return ThemeState(isDarkMode: isDarkMode);
  }

  @override
  List<Object> get props => [isDarkMode];
}
