import 'package:bloc_structure/app/bloc/theme/theme_bloc.dart';
import 'package:bloc_structure/app/routes/app_routes.dart';
import 'package:bloc_structure/home/bloc/home_bloc.dart';
import 'package:bloc_structure/home/view/home_page.dart';
import 'package:bloc_structure/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get navigator => _navigatorKey.currentState!;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (homeContext) => HomeBloc()),
      ],
      child: BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: buildWithTheme(),
      ),
    );
  }

  Widget buildWithTheme() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return MaterialApp(
          navigatorKey: _navigatorKey,
          onGenerateRoute: AppRoutes().onGeneratedRoute,
          debugShowCheckedModeBanner: false,
          // debugShowMaterialGrid: true,
          theme: themeState.themeData,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomePage(),
        );
      },
    );
  }
}
