part of 'home_bloc.dart';

@immutable
class HomeState {
  const HomeState({
    required this.bottomNavPage,
  });
  final int bottomNavPage;

  HomeState copyWith({
    int? bottomNavPage,
  }) {
    return HomeState(
      bottomNavPage: bottomNavPage ?? this.bottomNavPage,
    );
  }
}
