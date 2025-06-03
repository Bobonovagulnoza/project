import 'package:project/data/repositorys/product_repositoty.dart';
import '../data_sources/product_remote_data.dart';
import '../network/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remote;
  ProductRepositoryImpl(this.remote);

  @override
  Future<List<Product>> getAllProducts() async {
    final models = await remote.getAllProducts();
    return models.map((e) => Product(
      id: e.id,
      title: e.title,
      description: e.description,
      price: e.price,
      image: e.image,
    )).toList();
  }

  @override
  Future<Product> getProductById(int id) async {
    final e = await remote.getProductById(id);
    return Product(
      id: e.id,
      title: e.title,
      description: e.description,
      price: e.price,
      image: e.image,
    );
  }
}
