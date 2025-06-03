import '../network/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(int id);
}
