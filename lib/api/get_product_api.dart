import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:oru_app/models/get_product.dart';

class ApiProvider {
  final String baseUrl =
      "https://dev2be.oruphones.com/api/v1/global/assignment";
  Future<List<Listing>> getListings(
      {required int page, required int limit}) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/getListings?page=$page&limit=$limit'));
      if (response.statusCode == 200) {
        log("apiRun_____________________00");
        final List<dynamic> data = json.decode(response.body)['listings'];
        return data.map((item) => Listing.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load listings_______________');
      }
    } catch (e) {
      throw Exception('Failed to load listings:$e');
    }
  }
}
