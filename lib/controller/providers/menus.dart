import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/menu.dart';
import '../constants/api_constants.dart';

class Menus with ChangeNotifier {
  List<Menu> _menuList = [];

  List<Menu> get response {
    return [..._menuList];
  }

  Future<void> getMenuFromApi() async {
    final url = Uri.parse("$api/uz-latn/api/menu/");

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          apiKeyName: apiKeyValue,
        },
      );

      if (jsonDecode(response.body) != null) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final List<Menu> loadedMenu = [];

        for (int i = 0; i < data.length; i++) {
          loadedMenu.add(Menu.fromJson(data[i]));
        }
        _menuList = loadedMenu;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
