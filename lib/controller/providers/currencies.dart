import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:platina/model/currency.dart';
import 'package:http/http.dart' as http;

class Currencies with ChangeNotifier {
  List<Currency> _currencyList = [];

  List<Currency> get response {
    return [..._currencyList];
  }

  Future<void> getCurrencyFromApi() async {
    final url = Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/");

    try {
      final response = await http.get(
        url,
      );

      if (jsonDecode(response.body) != null) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final List<Currency> loadedCurrency = [];

        for (int i = 0; i < data.length; i++) {
          loadedCurrency.add(Currency.fromJson(data[i]));
        }
        _currencyList = loadedCurrency;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
