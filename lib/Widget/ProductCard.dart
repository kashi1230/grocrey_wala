import 'package:flutter/material.dart';

import '../model/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  ProductCard({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('\$${product.price.toString()}'),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: onAdd,
        ),
      ),
    );
  }
}
