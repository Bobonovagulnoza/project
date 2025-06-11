import 'package:get_it/get_it.dart';
import 'package:project/features/products/data/repository/products_repository_impl.dart';
import 'package:project/features/products/presentation/bloc/products_bloc/products_bloc.dart';

import '../interceptor/interceptor.dart';

final sl = GetIt.instance;

Future<void> serviceLocator() async {
  _client();
  _styles();
  _dataSources();
  _repositories();
  _useCase();
  _blocs();
}
void _client() {
  sl.registerSingleton(() => DioClient());
}
void _useCase(){}
void _repositories() {
  sl.registerLazySingleton(()=>ProductsRepositoryImpl(sl<DioClient>));
}
void _blocs(){
  sl.registerFactory(()=> ProductsBloc(sl<ProductsRepositoryImpl>()));
  // sl.registerFactory(()=> ProductBloc(sl<ProductsRepositoryImpl>()));
}
void _dataSources() {}
void _styles(){}




