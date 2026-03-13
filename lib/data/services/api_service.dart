import 'dart:convert';
import 'package:flutter_api_integration/connectivity/constants/app_urls.dart';
import 'package:flutter_api_integration/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static Future<List<Product>> fetchProducts() async {

    final response = await http.get(Uri.parse(AppUrls.productUrl));

    if (response.statusCode == 200) {

      List data = json.decode(response.body);

      return data.map((e) => Product.fromJson(e)).toList();

    } else {
      throw Exception("Failed to load products");
    }
  }
}