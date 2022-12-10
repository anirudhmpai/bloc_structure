import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locfet/app/bloc/theme/theme_bloc.dart';
import 'package:locfet/app/helpers/enums.dart';
import 'package:locfet/app/helpers/theme.dart';

GlobalKey switcherGlobalKey = GlobalKey();

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
            offset: switcherOffset.translate(150, 15),
          ),
          child: child,
        );
      },
    );
  }

  BlocBuilder<ThemeBloc, ThemeState> bodyHomePage() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                key: switcherGlobalKey,
                onPressed: () {
                  _getSwitcherCoordinates();
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
  }

  void _getSwitcherCoordinates() {
    final renderBox =
        // ignore: cast_nullable_to_non_nullable
        switcherGlobalKey.currentContext?.findRenderObject() as RenderBox;
    switcherOffset = renderBox.localToGlobal(Offset.zero);
    _controller.duration = const Duration(milliseconds: 500);
  }
}
