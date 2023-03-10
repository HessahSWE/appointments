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
      var user = await Dio().get('http://192.168.8.162:8000/api/user',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (user.statusCode == 200 && user.data != '') {
        print(json.encode(user.data));
        print('kkkkkkkkkkkkkkkkkkkk');
        return json.encode(user.data);
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> registerUser(
      String username, String email, String password) async {
    try {
      var response = await Dio().post(
        'http://192.168.8.162:8000/api/register',
        data: {'name': username, 'email': email, 'password': password},
        options: Options(
            contentType: 'application/json',
            headers: {"Accept": "application/json"}),
      );
      if (response.statusCode == 201 && response.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }
}
