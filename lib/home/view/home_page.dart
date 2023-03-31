import 'package:bloc_structure/app/bloc/theme/theme_bloc.dart';
import 'package:bloc_structure/app/helpers/enums.dart';
import 'package:bloc_structure/app/helpers/theme.dart';
import 'package:bloc_structure/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey switcherGlobalKey = GlobalKey();
GlobalKey bottomNavHomeGlobalKey = GlobalKey();
GlobalKey bottomNavSearchGlobalKey = GlobalKey();
GlobalKey bottomNavMapsGlobalKey = GlobalKey();
GlobalKey bottomNavProfileGlobalKey = GlobalKey();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset switcherOffset = Offset.zero;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller
      ..duration = Duration.zero
      ..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: bodyHomePage(),
      builder: (_, child) {
        return ClipPath(
          clipper: MyClipper(
            sizeRate: _controller.value,
            offset: switcherOffset.translate(35, 15),
          ),
          child: child,
        );
      },
    );
  }

  BlocBuilder<ThemeBloc, ThemeState> bodyHomePage() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (homeContext, homeState) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: _bottomNavigationItems(),
                currentIndex: homeState.bottomNavPage,
                onTap: (pageNumber) {
                  // _getSwitcherCoordinates(getPageKey(pageNumber));
                  homeContext
                      .read<HomeBloc>()
                      .add(BottomNavPageChanged(pageNumber: pageNumber));
                  // _controller
                  //   ..reset()
                  //   ..forward();
                },
                backgroundColor: Theme.of(context).colorScheme.background,
                selectedItemColor: Theme.of(context).colorScheme.primary,
                unselectedItemColor: Theme.of(context).colorScheme.onSurface,
              ),
              appBar: AppBar(
                actions: [
                  IconButton(
                    key: switcherGlobalKey,
                    onPressed: () {
                      _getSwitcherCoordinates(switcherGlobalKey);
                      themeContext.read<ThemeBloc>().add(
                            ThemeChanged(
                              theme: AppTheme
                                  .values[themeState.themeValue == 0 ? 1 : 0],
                              themeValue: themeState.themeValue == 0 ? 1 : 0,
                            ),
                          );
                      _controller
                        ..reset()
                        ..forward();
                    },
                    icon: Icon(
                      themeState.themeValue == 0 ? Icons.cloud : Icons.sunny,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _getSwitcherCoordinates(GlobalKey globalKey) {
    final renderBox =
        // ignore: cast_nullable_to_non_nullable
        globalKey.currentContext?.findRenderObject() as RenderBox;
    switcherOffset = renderBox.localToGlobal(Offset.zero);
    _controller.duration = const Duration(milliseconds: 500);
  }

  List<BottomNavigationBarItem> _bottomNavigationItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          key: bottomNavHomeGlobalKey,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
          key: bottomNavSearchGlobalKey,
        ),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.map,
          key: bottomNavMapsGlobalKey,
        ),
        label: 'Map',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          key: bottomNavProfileGlobalKey,
        ),
        label: 'Profile',
      )
    ];
  }

  GlobalKey<State<StatefulWidget>> getPageKey(int pageNumber) {
    switch (pageNumber) {
      case 0:
        return bottomNavHomeGlobalKey;
      case 1:
        return bottomNavSearchGlobalKey;
      case 2:
        return bottomNavMapsGlobalKey;
      case 3:
        return bottomNavProfileGlobalKey;
      default:
        return bottomNavHomeGlobalKey;
    }
  }
}
