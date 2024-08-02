
import '../model/Product.dart';

class ProductService {
  static List<Product> _products = [];

  static Future<void> addProduct(Product product) async {
    _products.add(product);
  }

  static Future<List<Product>> getProducts() async {
    return _products;
  }
}
