import 'package:flutter_meetuper/src/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostApiProvider {
  static final PostApiProvider _singleton = PostApiProvider._internal();
  factory PostApiProvider() {
    return _singleton;
  }

  PostApiProvider._internal();

  Future<List<Post>> fetchPosts() async {
    final res = await http.get('https://jsonplaceholder.typicode.com/posts');
    final List<dynamic> parsedPosts = json.decode(res.body);
    return parsedPosts.map((post) {
      return Post.fromJSON(post);
    }).toList();
  }
}
