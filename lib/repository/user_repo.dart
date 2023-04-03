import 'dart:convert';

import 'package:http/http.dart';
import 'package:repository_example/model/user_model.dart';

class UserRepo {
  final String src = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(src));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];

      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
