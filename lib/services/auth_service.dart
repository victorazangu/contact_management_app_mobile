import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import '../utils/constants.dart';

class AuthWebService {
  var dio = Dio();

  AuthWebService() {
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<void> saveToken(String token) async {
    final tokenBox = await Hive.openBox<String>("tokenBox");
    await tokenBox.put("token", token);
  }

  Future<Map<String, dynamic>?> register(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(Constants.register, data: data);

      if (response.statusCode == 201) {
        Map<String, dynamic> responseData = response.data;
        return responseData;
      } else if (response.statusCode == 422) {
        Map<String, dynamic> errorData = response.data;
        print("Validation Errors: $errorData");
        return null;
      } else {
        print("Error: HTTP Status Code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      var data = {
        'email': email,
        'password': password,
      };

      final response = await dio.post(Constants.login, data: data);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        saveToken(responseData['access_token']);

        return responseData;
      } else if (response.statusCode == 422) {
        if (response.data is Map<String, dynamic>) {
          Map<String, dynamic> errorData = response.data;
          print("Validation Errors: $errorData");
        } else {
          print("Validation Errors: Response data is not a map");
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
