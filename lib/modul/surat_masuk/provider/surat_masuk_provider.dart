//this part api include filter by unread letter as api
// uratmasuk/?per_page=15&page=' + page, { headers: headers }
// example request is look like
// import 'package:sisumakerv2/src/model/common_model.dart';
import 'package:sisumakerv2/src/utils/common.dart';
import 'package:sisumakerv2/src/utils/network.dart';
import 'package:sisumakerv2/modul/surat_masuk/model/surat_masuk_model.dart';

class SuratmasukProv {
  // Network _network = new Network();
  // static Future<SuratMasukModel> getdata(String body, String year) async {
  //   final String url = '';
  //   String dir = '';
  //   final String token = Storage.getStorage('token') as String;

  //   switch (year) {
  //     case '2018':
  //       dir = '/surattangsel18';
  //       break;
  //     case '2019':
  //       dir = '/surattangsel19';
  //       break;
  //     case '2020':
  //       dir = '/surattangsel20';
  //       break;
  //     default:
  //   }

  static Future<SuratMasukModel> fetchSuratMasuk() async {
    try {
      final Map result = await Network.get(
        'http://sisumaker.tangerangselatankota.go.id/surattangsel20/api/suratmasuk/filter?per_page=50&page=1&search=1',
        headers: {
          'content-type': 'application/json',
          'Authorization':
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdXRoX2lkIjoiMzI1NyIsInBlZ2F3YWlfaWQiOiIzMTcxIiwidXNlcm5hbWUiOiJ5dXN1ZiIsInVzZXJuYW1lX3AiOiJmZjE4NmYxNTE2YzhlODIzMTkzYWJjODk5ZjdhNWQ2ZTI3NTNlMjg2Iiwic2twZF9pZCI6IjE1MCIsInRtdW5pdGtlcmphX2lkIjoiMTUyMCIsInJlYWxuYW1lIjoibXVoYW1tYWQgeXVzdWYiLCJpYXQiOjE2MDY0NDU5NzIsImV4cCI6MTYwOTA3NTcxOH0.Pu8Ut50tGbsIOpGEJJdW6VbYAjbrCy-3KmSzcZtsKlY'
        },
      );
      // print(result['data']);
      // print('kampret');
      return SuratMasukModel.fromJson(result);
    } catch (e) {
      throw SuratMasukModel.fromJson(e);
    }
  }

  // try {
  //   final response = await Network.get(
  //     url + dir + '/api/suratmasuk/filter?per_page=50&page=1&search=1',
  //     headers: {'Content-type': 'application/json', 'Authorization': token},
  //   );
  //   return SuratMasukModel.fromJson(response);
  // } catch (e) {
  //   throw Exception('failed request data');
  // }
}
