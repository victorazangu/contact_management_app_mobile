import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import '../utils/constants.dart';

class UserWebService {
  var dio = Dio();

  Future<String?> loadToken() async {
    final tokenBox = await Hive.openBox<String>("tokenBox");
    return tokenBox.get("token");
  }

  Future<void> deleteToken() async {
    final tokenBox = await Hive.openBox<String>("tokenBox");
    await tokenBox.delete("token");
  }

  UserWebService() {
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<Map<String, dynamic>> profile() async {
    final token = await loadToken();

    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = await dio.get(Constants.profile);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.data['data'];
      return responseData;
    } else {
      throw Exception("Error");
    }
  }

  Future<void> logout() async {
    final token = await loadToken();

    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = await dio.post(Constants.logout);

    if (response.statusCode == 200) {
      deleteToken();
      Hive.close();
    } else {
      throw Exception("Error during logout");
    }
  }

  Future<Map<String, dynamic>> updateUserProfile(data) async {
    final token = await loadToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Content-Type'] = 'multipart/form-data';
    final response = await dio.put(Constants.updateUserProfile, data: data);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.data['data'];
      return responseData;
    } else {
      throw Exception("Error");
    }
  }
}
