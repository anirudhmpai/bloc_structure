// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
class HomeState {
  final int bottomNavPage;
  const HomeState({
    required this.bottomNavPage,
  });

  HomeState copyWith({
    int? bottomNavPage,
  }) {
    return HomeState(
      bottomNavPage: bottomNavPage ?? this.bottomNavPage,
    );
  }
}
