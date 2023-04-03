import 'dart:convert';

import 'package:http/http.dart';
import 'package:repository_example/model/sample_model.dart';

class ApiRepo {
  final String src = 'https://jsonplaceholder.typicode.com/todos/';
  Future<List<SampleModel>> getData() async {
    Response response = await get(Uri.parse(src));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => SampleModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
