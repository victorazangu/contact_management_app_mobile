import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../models/group.dart';
import '../utils/constants.dart';

class GroupWebService {
  var dio = Dio();
  Future<String?> loadToken() async {
    final tokenBox = await Hive.openBox<String>("tokenBox");
    return tokenBox.get("token");
  }

  GroupWebService() {
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<List<Group>> fetchAllGroups() async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response = await dio.get(Constants.multipleGroups);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      final List<Map<String, dynamic>> groupDataList =
          List<Map<String, dynamic>>.from(responseData);

      List<Group> groups =
          groupDataList.map((group) => Group.fromJson(group)).toList();

      return groups;
    } else {
      throw Exception("Error");
    }
  }

  Future<Map<String, dynamic>> createGroup(data) async {
    final token = await loadToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    print(data);
    final response = await dio.post(Constants.multipleGroups, data: data);
    if (response.statusCode == 201) {
      final result = response.data;
      return result['data'];
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Group>> updateGroup(group_id, data) async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response =
        await dio.put(Constants.singleGroups(group_id), data: data);
    if (response.statusCode == 200) {
      final result = response.data;
      return result['data'];
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Group>> deleteGroup(group_id) async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response = await dio.get(Constants.singleGroups(group_id));
    if (response.statusCode == 200) {
      final result = response.data;
      return result['data'];
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Group>> viewSingleGroup(group_id) async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response = await dio.get(Constants.singleGroups(group_id));
    if (response.statusCode == 200) {
      final result = response.data;
      return result['data'];
    } else {
      throw Exception("Error");
    }
  }

  Future<Map<String, dynamic>> addContactToGroup(group_id, contact_id) async {
    final token = await loadToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final response =
        await dio.post(Constants.addContactToGroup(group_id, contact_id));
    if (response.statusCode == 200) {
      final result = response.data;
      return result;
    } else {
      throw Exception("Error");
    }
  }

  Future<Map<String, dynamic>> removeContactFromGroup(
      group_id, contact_id) async {
    final token = await loadToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await dio
        .delete(Constants.removeContactFromGroup(group_id, contact_id));
    if (response.statusCode == 200) {
      final result = response.data;
      return result;
    } else {
      throw Exception("Error");
    }
  }
}
