import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static Dio dio = Dio();
  static init() {}

  Future<dynamic> getData() async {
    var acc = await dio.get('https://91.229.118.182:5000/api/accounts');
    // print(acc.data);
    return acc.data;
  }
}

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
}
