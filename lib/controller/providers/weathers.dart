import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:platina/model/weather.dart';

class Weathers with ChangeNotifier {
  Temperatures? _temperatures;

  Temperatures get response {
    return _temperatures!;
  }

  Future<void> getWeatherFromApi() async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=uzbekistan&units=metric&appid=02608af23a9d7f99c1e762ee9a874d61');

    try {
      final response = await http.get(
        url,
      );

      if (jsonDecode(response.body) != null) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        _temperatures = Temperatures.fromJson(data);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
