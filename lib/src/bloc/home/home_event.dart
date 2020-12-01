part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchMenu extends HomeEvent {}

class FetchNews extends HomeEvent {}
