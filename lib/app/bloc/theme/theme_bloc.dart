import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:locfet/app/helpers/enums.dart';
import 'package:locfet/app/helpers/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            themeData: appThemeData[AppTheme.light]!,
            themeValue: 0,
          ),
        ) {
    on<ThemeEvent>((event, emit) {});
    on<ThemeChanged>(themeChanged);
  }

  FutureOr<void> themeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(
      ThemeState(
        themeData: appThemeData[event.theme]!,
        themeValue: event.themeValue,
      ),
    );
  }
}
