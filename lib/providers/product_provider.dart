import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  late List<Product> _products;

  List<Product> get products => _products;

  ProductProvider() {
    _products = [];
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:3000/products'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _products = responseData.map((data) => Product.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
