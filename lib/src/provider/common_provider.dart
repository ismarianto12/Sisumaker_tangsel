import 'package:sisumakerv2/src/model/common_model.dart';
import 'package:sisumakerv2/src/utils/api.dart';
import 'package:sisumakerv2/src/utils/network.dart';

class CommonProvider {
  Future<dynamic> cekApi(String domain) async {
    try {
      final Map result = await Network.apiCek(
        'http://' + domain + '/api/auth/cekApi',
      );

      api = result['link'];
      cekDomain();
      return {
        'status': 1,
        'messages': 'succesfully',
      };
    } catch (e) {
      try {
        final Map result = await Network.apiCek(
          'https://' + domain + '/api/auth/cekApi',
        );

        api = result['link'];

        cekDomain();

        return {
          'status': 1,
          'messages': 'succesfully',
        };
      } catch (e) {
        return throw e;
      }
    }
  }

  Future<dynamic> cekDomain() async {
    try {
      final Map result = await Network.get('/api/auth/domain');

      dir18 = result['dir18'];
      dir19 = result['dir19'];
      dir20 = result['dir20'];

      return ResponseModel.fromJson({
        'status': 1,
        'messages': 'succesfully',
      });
    } catch (e) {
      return ResponseModel.fromJson(e);
    }
  }
}
