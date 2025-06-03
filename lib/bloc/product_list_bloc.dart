import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project/bloc/product_list_event.dart';
import 'package:project/bloc/product_list_state.dart';
import '../data/repositorys/product_repositoty.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository repository;

  ProductListBloc(this.repository) : super(ProductListInitial()) {
    on<FetchProductList>((event, emit) async {
      emit(ProductListLoading());
      try {
        final products = await repository.getAllProducts();
        emit(ProductListLoaded(products));
      } catch (_) {
        emit(ProductListError("Failed to load products"));
      }
    });
  }
}
