import 'package:dio/dio.dart';

import '../data_sources/product_remote_data.dart';
import '../repositorys/product_repositoty.dart';
import '../repositorys/product_repository.dart';
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(sl()),
  );
}
