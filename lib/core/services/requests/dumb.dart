import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchPost() async {
  final http.Response response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200)
    return json.decode(response.body);
  else
    throw Exception('Failed to load post');
}
