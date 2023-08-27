import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:platina/controller/constants/api_constants.dart';
import 'package:platina/model/article.dart';
import 'package:http/http.dart' as http;

class Articles with ChangeNotifier {
  Article? _article;

  Article get response {
    return _article!;
  }

  Future<void> getArticleFromApi() async {
    final url = Uri.parse('$api/uz-latn/api/articles/');

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
        _article = Article.fromJson(data);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Result? findById(int articleId) {
    return _article != null
        ? _article?.results.firstWhere((article) => article.id == articleId)
        : null;
  }
}
