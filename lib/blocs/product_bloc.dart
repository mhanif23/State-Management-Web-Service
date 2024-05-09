import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}

class ProductBloc extends Bloc<ProductEvent, List<Product>> {
  ProductBloc() : super([]);

  @override
  Stream<List<Product>> mapEventToState(ProductEvent event) async* {
    if (event is FetchProducts) {
      yield await fetchProducts();
    }
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
