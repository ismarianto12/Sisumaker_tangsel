import 'package:sisumakerv2/src/model/common_model.dart';
import 'package:sisumakerv2/src/utils/common.dart';
import 'package:sisumakerv2/src/utils/network.dart';

class AuthProvider {
  static Future<ResponseModel> login(Map body, String year) async {
    String dir = '';

    switch (year) {
      case '2018':
        dir = '/surattangsel18';
        break;
      case '2019':
        dir = '/surattangsel19';
        break;
      case '2020':
        dir = '/surattangsel20';
        break;
      default:
    }

    try {
      final Map result = await Network.post(
        dir + '/api/auth',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      // Menyimpan token ke storage
      Storage.setStorage(result['id_token']);

      return ResponseModel.fromJson(result);
    } catch (e) {
      return throw ResponseModel.fromJson(e);
    }
  }
}
