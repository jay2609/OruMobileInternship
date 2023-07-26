// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/filter_model.dart';

class ApiService {
  Future<FiltersModel> getFilters() async {
    const apiUrl =
        'https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      return FiltersModel.fromJson(jsonData['filters']);
    } else {
      throw Exception('Failed to load filters: ${response.body}');
    }
  }
}
