import '../../../../core/interceptor/interceptor.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/repository/products_repository.dart';
import '../models/product_model.dart';
import '../models/products_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final DioClient dio;
  ProductsRepositoryImpl(this.dio);

  @override
  Future<ProductsModel> fetchDiscountProducts() async {
    final response = await dio.dioClient.get('/products-dicount');
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductsModel.fromMap(response.data);
    }
    throw response.data;
  }

  @override
  Future<ProductsModel> fetchHitProducts() async {
    final response = await dio.dioClient.get('/products-hit');
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductsModel.fromMap(response.data);
    }
    throw response.data;
  }

  @override
  Future<ProductsModel> fetchNewProducts() async {
    final response = await dio.dioClient.get('/products-new');
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductsModel.fromMap(response.data);
    }
    throw response.data;
  }

  @override
  Future<ProductModel> fetchProductById(int id) async {
    final response = await dio.dioClient.get('/products/$id');
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductModel.fromMap(response.data);
    }
    throw response.data;
  }

  @override
  Future<ProductsModel> fetchProducts() async {
    final response = await dio.dioClient.get('/products');
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductsModel.fromMap(response.data);
    }
    throw response.data;
  }
}
