import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:platina/controller/constants/api_constants.dart';
import 'package:platina/model/post.dart';
import 'package:http/http.dart' as http;

class Posts with ChangeNotifier {
  Post? _post;

  Post get response {
    return _post!;
  }

  Future<void> getPostFromApi() async {
    final url = Uri.parse("$api/uz-latn/api/posts/");

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          apiKeyName: apiKeyValue,
        },
      );

      if (jsonDecode(response.body) != null) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        _post = Post.fromJson(data);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Result? findById(int postId) {
    return _post != null
        ? _post?.results.firstWhere((element) => element.id == postId)
        : null;
  }
}
