import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(bottomNavPage: 0)) {
    on<HomeEvent>((event, emit) {});
    on<BottomNavPageChanged>(bottomNavPageChanged);
  }

  FutureOr<void> bottomNavPageChanged(
    BottomNavPageChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeState(bottomNavPage: event.pageNumber));
  }
}
