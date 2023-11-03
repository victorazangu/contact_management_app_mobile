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

  Future<Map<String, dynamic>?> profile() async {
    final token = await loadToken();

    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = await dio.get(Constants.profile);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.data;

      print("profile at service $responseData");
      return responseData;
    } else {
      throw Exception("Error");
    }
  }

  Future<Map<String, dynamic>?> logout() async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response = await dio.get(Constants.logout);
    if (response.statusCode == 200) {
      final result = response.data;
      deleteToken();
      Hive.close();
      return result;
    } else {
      throw Exception("Error");
    }
  }

  Future<Map<String, dynamic>?> updateProfilePicture() async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response = await dio.put(Constants.updateProfilePicture);
    if (response.statusCode == 200) {
      final result = response.data;
      Map<String, dynamic> responseData = json.decode(result);
      return responseData;
    } else {
      throw Exception("Error");
    }
  }
}
