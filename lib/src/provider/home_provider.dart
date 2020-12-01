import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sisumakerv2/src/model/home_model.dart';
import 'package:sisumakerv2/src/utils/network.dart';

class HomeProvider {
  static Future<HomeModel> getMenu() async {
    try {
      String stringJson = await rootBundle.loadString("lib/assets/menu.json");
      final Map jsonData = json.decode(stringJson);
      return HomeModel.fromJson(jsonData);
    } catch (e) {
      return throw HomeModel.fromJson({
        'status': 0,
        'messages': 'Error Maping data',
      });
    }
  }

  // ignore: missing_return
  static Future<HomeModel> getNews() async {
    try {
      final Map result = await Network.get(
        '/auth/berita',
        headers: {'Content-Type': 'application/json'},
      );
      print(result);
    } catch (e) {
      print(e);
    }
  }
}
