import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_bloc.dart';
import '../models/product.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: BlocBuilder<ProductBloc, List<Product>>(
        builder: (context, productList) {
          if (productList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (ctx, index) {
                Product product = productList[index];
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${product.brand} ${product.model}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Processor: ${product.processor}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'RAM: ${product.ram}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Storage: ${product.storage}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Display Size: ${product.displaySize.toStringAsFixed(2)}"',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Graphics Card: ${product.graphicsCard}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
