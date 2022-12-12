import 'package:flutter/material.dart';
import 'package:locfet/app/helpers/enums.dart';

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(colorScheme: colorScheme[AppTheme.light]),
  AppTheme.dark: ThemeData(colorScheme: colorScheme[AppTheme.dark]),
};

Map<AppTheme, ColorScheme> colorScheme = {
  AppTheme.light: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff4c9bba),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xff9cebeb),
    onPrimaryContainer: Color(0xff0d1414),
    secondary: Color(0xffbf4a50),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xfffcbdbd),
    onSecondaryContainer: Color(0xff141010),
    tertiary: Color(0xffff4f58),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffffdad7),
    onTertiaryContainer: Color(0xff141212),
    error: Color(0xffb00020),
    onError: Color(0xffffffff),
    errorContainer: Color(0xfffcd8df),
    onErrorContainer: Color(0xff141213),
    background: Color(0xfff8fbfc),
    onBackground: Color(0xff090909),
    surface: Color(0xfff8fbfc),
    onSurface: Color(0xff090909),
    surfaceVariant: Color(0xfff2f7fa),
    onSurfaceVariant: Color(0xff121313),
    outline: Color(0xff565656),
    shadow: Color(0xff000000),
    inverseSurface: Color(0xff131516),
    onInverseSurface: Color(0xfff5f5f5),
    inversePrimary: Color(0xffe5ffff),
    surfaceTint: Color(0xff4c9bba),
  ),
  AppTheme.dark: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff669db3),
    onPrimary: Color(0xfff7fbfd),
    primaryContainer: Color(0xff078282),
    onPrimaryContainer: Color(0xffe0f4f4),
    secondary: Color(0xfff75f67),
    onSecondary: Color(0xfffff6f7),
    secondaryContainer: Color(0xff580810),
    onSecondaryContainer: Color(0xffede1e2),
    tertiary: Color(0xfffc6e75),
    onTertiary: Color(0xfffff7f8),
    tertiaryContainer: Color(0xff92001a),
    onTertiaryContainer: Color(0xfff6dfe3),
    error: Color(0xffcf6679),
    onError: Color(0xff140c0d),
    errorContainer: Color(0xffb1384e),
    onErrorContainer: Color(0xfffbe8ec),
    background: Color(0xff16191a),
    onBackground: Color(0xffececed),
    surface: Color(0xff16191a),
    onSurface: Color(0xffececed),
    surfaceVariant: Color(0xff1b2124),
    onSurfaceVariant: Color(0xffdbdcdc),
    outline: Color(0xff9d9da3),
    shadow: Color(0xff000000),
    inverseSurface: Color(0xfff6f9fa),
    onInverseSurface: Color(0xff131313),
    inversePrimary: Color(0xff3b535c),
    surfaceTint: Color(0xff669db3),
  )
};

class MyClipper extends CustomClipper<Path> {
  MyClipper({required this.sizeRate, required this.offset});
  final double sizeRate;
  final Offset offset;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..addOval(
        Rect.fromCircle(center: offset, radius: size.height * sizeRate * 1.2),
      );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class AppThemes {
  static ThemeData? getThemeFromKey(AppTheme themeKey) {
    switch (themeKey) {
      case AppTheme.light:
        return appThemeData[AppTheme.light];
      case AppTheme.dark:
        return appThemeData[AppTheme.dark];
    }
  }
}

class ThemeRoute extends PageRouteBuilder<dynamic> {
  ThemeRoute(this.widget)
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: transitionsBuilder,
        );

  final Widget widget;
}

Widget transitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  Tween<double>(
    begin: 0,
    end: 100,
  ).animate(animation);
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(animation),
    child: Container(
      child: child,
    ),
  );
}
