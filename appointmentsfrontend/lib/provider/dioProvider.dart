import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioProvider {
  Future<dynamic> getToken(String email, String password) async {
    try {
      var response = await Dio().post(
        'http://192.168.8.162:8000/api/login',
        data: {'email': email, 'password': password},
        options: Options(
            contentType: 'application/json',
            headers: {"Accept": "application/json"}),
      );
      if (response.statusCode == 200 && response.data != '') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> getUser(String token) async {
    try {
      var user = await Dio().get('http://192.168.8.162:8000/api/login',
          options: Options(headers: {'Authorization': 'bearer'}));
      if (user.statusCode == 200 && user.data != '') {
        return json.encode(user.data);
      }
    } catch (error) {
      return error;
    }
  }
}
