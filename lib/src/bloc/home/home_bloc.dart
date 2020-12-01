import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sisumakerv2/src/model/home_model.dart';
import 'package:sisumakerv2/src/provider/home_provider.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeMenuBloc extends Bloc<HomeEvent, HomeState> {
  HomeMenuBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchMenu) {
      yield HomeLoading();
      try {
        final result = await HomeProvider.getMenu();
        yield HomeLoaded(homeModel: result);
      } catch (e) {
        yield HomeError();
      }
    }
  }
}

class HomeNewsBloc extends Bloc<HomeEvent, HomeState> {
  HomeNewsBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchNews) {
      yield HomeLoading();
      try {
        final result = await HomeProvider.getNews();
        yield HomeLoaded();
      } catch (e) {
        yield HomeError();
      }
    }
  }
}
