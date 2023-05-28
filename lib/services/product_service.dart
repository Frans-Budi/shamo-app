import 'dart:convert';

import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  // String baseUrl = 'https://kuliku.site/shamo.com/api';
  String baseUrl = 'http://192.168.1.100:90/api';

  Future<List<ProductModel>?> getProduct() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // print('hello');

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];
      // print(data);

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
        // print(item);
      }
      // print(products);
      return products;
    } else {
      throw Exception('Gagal Get Products');
    }
  }
}
