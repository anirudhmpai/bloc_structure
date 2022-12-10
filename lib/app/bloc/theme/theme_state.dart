part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  const ThemeState({
    required this.themeData,
    required this.themeValue,
  });
  final ThemeData themeData;
  final int themeValue;
  @override
  List<Object?> get props => [themeData, themeValue];
}
