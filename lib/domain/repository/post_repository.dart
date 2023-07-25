import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostRepository {
  Future<List<Post>> showAllPosts() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
