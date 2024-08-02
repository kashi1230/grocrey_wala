import 'package:flutter/material.dart';

import '../Services/BillingServie.dart';
import '../Services/ProductScervice.dart';
import '../model/Product.dart';

class BillingScreen extends StatefulWidget {
  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  List<Product> _products = [];
  final Map<Product, int> _billingItems = {};

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() async {
    List<Product> products = await ProductService.getProducts();
    setState(() {
      _products = products;
    });
  }

  void _addToBill(Product product, int quantity) {
    setState(() {
      if (_billingItems.containsKey(product)) {
        _billingItems[product] = _billingItems[product]! + quantity;
      } else {
        _billingItems[product] = quantity;
      }
    });
  }

  double _calculateTotal() {
    double total = 0.0;
    _billingItems.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  void _generateBill() {
    double total = _calculateTotal();
    BillingService.generateBill(_billingItems, total);
    // Navigate to bill summary screen or show a dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate Bill')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                Product product = _products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toString()}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _addToBill(product, 1);
                    },
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text('Total: \$${_calculateTotal().toStringAsFixed(2)}'),
          ),
          ElevatedButton(
            onPressed: _generateBill,
            child: Text('Generate Bill'),
          ),
        ],
      ),
    );
  }
}
