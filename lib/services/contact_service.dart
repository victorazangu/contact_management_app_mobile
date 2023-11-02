import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../models/contact.dart';
import '../utils/constants.dart';

class ContactWebService {
  var dio = Dio();

  Future<String?> loadToken() async {
    final tokenBox = await Hive.openBox<String>("tokenBox");
    return tokenBox.get("token");
  }

  ContactWebService() {
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';
  }

  // Future<List<Contact>> fetchAllContacts() async {
  //   final token = await loadToken();
  //   print("token inside ContactWebService $token");
  //   dio.options.headers['Authorization'] = 'Bearer $token';

  //   final response = await dio.get(Constants.multipleContacts);
  //   if (response.statusCode == 200) {
  //     final result = response.data;
  //     print("response.data ${response.data}");
  //     Iterable list = result;
  //     print("list inside ContactWebService $list");
  //     return list.map((contact) => Contact.fromJson(contact)).toList();
  //   } else {
  //     throw Exception("Error");
  //   }
  // }

  Future<List<Contact>> fetchAllContacts() async {
    final token = await loadToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await dio.get(Constants.multipleContacts);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Contact> contacts =
          data.map((contactData) => Contact.fromJson(contactData)).toList();
      return contacts;
    } else {
      throw Exception('Failed to fetch contacts');
    }
  }

  Future<List<Contact>> createContact(data) async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.headers['Content-Type'] = 'multipart/form-data';
    }
    final response = await dio.post(Constants.multipleContacts, data: data);
    if (response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Contact>> updateContact(contact_id, data) async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response =
        await dio.put(Constants.singleContacts(contact_id), data: data);
    if (response.statusCode == 200) {
      final result = response.data;
      return result['data'];
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Contact>> deleteContact(contact_id) async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response = await dio.get(Constants.singleContacts(contact_id));
    if (response.statusCode == 200) {
      final result = response.data;
      return result['data'];
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Contact>> viewSingleConact(contact_id) async {
    final token = await loadToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    final response = await dio.get(Constants.singleContacts(contact_id));
    if (response.statusCode == 200) {
      final result = response.data;
      return result['data'];
    } else {
      throw Exception("Error");
    }
  }
}
