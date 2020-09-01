import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meta/meta.dart' show required;
import 'package:dio/dio.dart';
import 'package:refresh_tokens_with_firebase/controllers/auth_controller.dart';
import 'package:refresh_tokens_with_firebase/models/app_user.dart';

class MyAPI {
  MyAPI._internal();
  static MyAPI _instance = MyAPI._internal();
  static MyAPI get instance => _instance;

  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://192.168.100.25:8080'));

  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    try {
      final response = await _dio.post('/login', data: {
        "email": email,
        "password": password,
      });
      return response.data; // string
    } catch (e) {
      if (e is DioError) {
        await Get.dialog(
          AlertDialog(
            title: Text("ERROR"),
            content: Text(e.response.data),
            actions: [
              FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"),
              )
            ],
          ),
        );
      }
      return null;
    }
  }

  Future<AppUser> getUserInfo() async {
    try {
      final String idToken = await AuthController.instance.idToken;
      final response = await _dio.get(
        '/get-user-info',
        options: Options(
          headers: {
            "token": idToken,
          },
        ),
      );
      return AppUser.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
