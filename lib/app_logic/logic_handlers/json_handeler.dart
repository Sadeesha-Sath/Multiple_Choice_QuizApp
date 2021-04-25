import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonHandeler {
  final String filePath = "assets/categories.json";
  Map<int, String> _apiMap = {-1: "Any"};

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString(filePath);
  }

  Future<Map<int, String>> parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    for (Map<String, dynamic> item in jsonResponse['trivia_categories']) {
      _apiMap[item['id']] = item['name'];
    }
    return _apiMap;
  }

  Map<int, String> get getMap => _apiMap;
}
