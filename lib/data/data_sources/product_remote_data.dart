import 'package:dio/dio.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    return (response.data as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final response = await dio.get('https://fakestoreapi.com/products/$id');
    return ProductModel.fromJson(response.data);
  }
}
