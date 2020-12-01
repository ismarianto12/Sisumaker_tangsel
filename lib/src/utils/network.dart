import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:sisumakerv2/src/utils/api.dart';

class Network {
  static Future<dynamic> get(String url, {Map<String, String> headers}) async {
    try {
      http.Response response = await http
          .get(
            api + url,
            headers: headers,
          )
          .timeout(
            const Duration(minutes: 1),
          );

      if (response.statusCode >= 200 && response.statusCode <= 208) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'GET',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );

        return jsonDecode(response.body);
      } else if (response.statusCode >= 400 && response.statusCode <= 418 ||
          response.statusCode >= 421 && response.statusCode <= 429 ||
          response.statusCode == 431 ||
          response.statusCode == 451) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'GET',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );

        return throw json.decode(response.body);
      } else if (response.statusCode >= 500 && response.statusCode <= 522) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'GET',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );

        return throw json.decode(response.body);
      } else {
        return throw {
          'status': 0,
          'messages': 'An error occurred when retrieving data',
        };
      }
    } on TimeoutException {
      return throw {
        'status': 0,
        'messages': 'Request time out',
      };
    } on SocketException {
      return throw {
        'status': 0,
        'messages': 'no internet access',
      };
    } on Exception catch (e) {
      return throw {
        'status': 0,
        'messages': e,
      };
    }
  }

  static Future<dynamic> post(
    String url, {
    Map<String, String> headers,
    dynamic body,
  }) async {
    try {
      http.Response response = await http
          .post(
            api + url,
            headers: headers,
            body: json.encode(body),
          )
          .timeout(
            const Duration(minutes: 1),
          );

      if (response.statusCode >= 200 && response.statusCode <= 208) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'POST',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );

        return jsonDecode(response.body);
      } else if (response.statusCode >= 400 && response.statusCode <= 418 ||
          response.statusCode >= 421 && response.statusCode <= 429 ||
          response.statusCode == 431 ||
          response.statusCode == 451) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'POST',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );
        developer.log('Parameter', name: 'POST', error: json.encode(body));

        return throw {
          'status': jsonData['status'],
          'messages': jsonData['message'],
        };
      } else if (response.statusCode >= 500 && response.statusCode <= 522) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'POST',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );
        developer.log('Parameter', name: 'POST', error: json.encode(body));

        return throw json.decode(response.body);
      } else {
        return throw {
          'status': 0,
          'messages': 'An error occurred when retrieving data',
        };
      }
    } on TimeoutException {
      return throw {
        'status': 0,
        'messages': 'Request time out',
      };
    } on SocketException {
      return throw {
        'status': 0,
        'messages': 'no internet access',
      };
    } on Exception catch (e) {
      return throw {
        'status': 0,
        'messages': e,
      };
    }
  }

  static Future<dynamic> apiCek(
    String url, {
    Map<String, String> headers,
  }) async {
    try {
      http.Response response = await http.get(url, headers: headers).timeout(
            const Duration(minutes: 1),
          );

      if (response.statusCode >= 200 && response.statusCode <= 208) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'GET',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );

        return jsonDecode(response.body);
      } else if (response.statusCode >= 400 && response.statusCode <= 418 ||
          response.statusCode >= 421 && response.statusCode <= 429 ||
          response.statusCode == 431 ||
          response.statusCode == 451) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'GET',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );

        return throw json.decode(response.body);
      } else if (response.statusCode >= 500 && response.statusCode <= 522) {
        var jsonData = json.decode(response.body);

        developer.log(
          url,
          name: 'GET',
          error: json.encode({
            'StatusCode': response.statusCode,
            'Messages': jsonData['messages'] == null
                ? 'message not found'
                : jsonData['messages'],
          }),
        );

        return throw json.decode(response.body);
      } else {
        return throw {
          'status': 0,
          'messages': 'An error occurred when retrieving data',
        };
      }
    } on TimeoutException {
      return throw {
        'status': 0,
        'messages': 'Request timeout',
      };
    } on SocketException {
      return throw {
        'status': 0,
        'messages': 'Domain tidak ditemukan',
      };
    } on Exception catch (e) {
      return throw {
        'status': 0,
        'messages': e,
      };
    }
  }
}
