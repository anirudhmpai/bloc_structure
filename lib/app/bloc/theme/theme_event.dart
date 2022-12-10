part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged({required this.theme, required this.themeValue});
  final AppTheme theme;
  final int themeValue;
}
