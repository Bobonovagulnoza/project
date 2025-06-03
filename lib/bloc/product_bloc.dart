import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/product_event.dart';
import 'package:project/bloc/product_state.dart';

import '../data/repositorys/product_repositoty.dart';
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository repository;

  ProductDetailBloc(this.repository) : super(ProductDetailInitial()) {
    on<FetchProductDetail>((event, emit) async {
      emit(ProductDetailLoading());
      try {
        final product = await repository.getProductById(event.id);
        emit(ProductDetailLoaded(product));
      } catch (_) {
        emit(ProductDetailError("Failed to load product"));
      }
    });
  }
}
