import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oru_app/models/search_product.dart';

class SearchApi {
  Future<SearchModel> searchModel(String queryParameter) async {
    const apiUrl =
        'https://dev2be.oruphones.com/api/v1/global/assignment/searchModel';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'searchModel': queryParameter});
    try {
      final response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: body);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return SearchModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load data: ${response.body}');
      }
    } catch (e) {
      throw Exception('api Error $e');
    }
  }
}
