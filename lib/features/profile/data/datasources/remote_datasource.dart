import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/profile_model.dart';

abstract class RemoteDataSource {
  Future<List<ProfileModel>> getAllUser(int page);
  Future<ProfileModel> getUser(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<ProfileModel>> getAllUser(int page) async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=$page");
    var response = await http.get(url);

    if (response.statusCode != 200) {
        throw Exception('Failed to load users, status code: ${response.statusCode}');
      }

    Map<String, dynamic> dataBody = jsonDecode(response.body);
     // Validasi apakah 'data' ada dan bukan null
    if (dataBody['data'] == null || dataBody['data'] is! List) {
      throw Exception('Invalid response: "data" is null or not a list');
    }
    List<dynamic> data = dataBody["data"];
    return ProfileModel.fromJsonList(data);
  }

  @override
  Future<ProfileModel> getUser(int id) async {
    Uri url = Uri.parse("https://reqres.in/api/users?id=$id");
    var response = await http.get(url);

    if (response.statusCode != 200) {
        throw Exception('Failed to load users, status code: ${response.statusCode}');
      }

    Map<String, dynamic> dataBody = jsonDecode(response.body);
    Map<String, dynamic> data = dataBody["data"];
    return ProfileModel.fromJson(data);
  }
}
