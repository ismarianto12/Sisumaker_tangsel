part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeModel homeModel;

  HomeLoaded({this.homeModel});
}

class HomeError extends HomeState {
  final HomeModel homeModel;

  HomeError({this.homeModel});
}
