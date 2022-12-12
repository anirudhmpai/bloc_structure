part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class BottomNavPageChanged extends HomeEvent {
  const BottomNavPageChanged({required this.pageNumber});
  final int pageNumber;
}
