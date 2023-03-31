// ignore_for_file: must_be_immutable

part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  ThemeState({
    this.themeData,
    this.themeValue,
  });

  factory ThemeState.fromJson(String source) =>
      ThemeState.fromMap(json.decode(source) as Map<String, dynamic>);

  ThemeState.fromMap(Map<String, dynamic> json) {
    if (json['themeValue'] != null) {
      themeValue = json['themeValue'] as int;
      if (themeValue == 0) {
        themeData = appThemeData[AppTheme.light];
      } else {
        themeData = appThemeData[AppTheme.dark];
      }
    }
  }
  String toJson() => json.encode(toMap());

  Map<String, dynamic>? toMap() {
    return <String, dynamic>{
      'themeValue': themeValue,
    };
  }

  ThemeData? themeData;
  int? themeValue;
  @override
  List<Object?> get props => [themeData, themeValue];
}
