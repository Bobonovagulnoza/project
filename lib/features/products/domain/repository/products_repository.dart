import '../../data/models/product_model.dart';
import '../../data/models/products_model.dart';

abstract class ProductsRepository {
  Future<ProductsModel> fetchProducts();
  Future<ProductsModel> fetchHitProducts();
  Future<ProductsModel> fetchDiscountProducts();
  Future<ProductsModel> fetchNewProducts();
  Future<ProductModel> fetchProductById(int id);
}
