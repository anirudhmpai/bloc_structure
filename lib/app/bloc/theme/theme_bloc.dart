import 'dart:async';
import 'dart:convert';

import 'package:bloc_structure/app/helpers/enums.dart';
import 'package:bloc_structure/app/helpers/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            themeData: appThemeData[AppTheme.light],
            themeValue: 0,
          ),
        ) {
    on<ThemeEvent>((event, emit) {});
    on<ThemeChanged>(themeChanged);
  }

  FutureOr<void> themeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(
      ThemeState(
        themeData: appThemeData[event.theme],
        themeValue: event.themeValue,
      ),
    );
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      return ThemeState.fromMap(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    try {
      return state.toMap();
    } catch (_) {
      return null;
    }
  }
}
