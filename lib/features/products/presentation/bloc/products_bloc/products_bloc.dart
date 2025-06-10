import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/products/presentation/bloc/products_bloc/products_event.dart';
import 'package:project/features/products/presentation/bloc/products_bloc/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepo sitoryImpl impl;
  ProductsBloc(this.impl) : super(ProductsLoadingState()) {
    on<ProductsFetchEvent>(_productsFetchEvent);
    on<ProductsFetchHitEvent>(_productsFetchHitEvent);
    on<ProductsFetchDiscountEvent>(_productsFetchDiscountEvent);
    on<ProductsFetchNewEvent>(_productsFetchNewEvent);
  }
  _productsFetchEvent(
    ProductsFetchEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final request = await impl.fetchProducts();
    try {
      
    } catch (e) {
      emit(ProductsFailureState(error));
    }
  }

  _productsFetchHitEvent(
    ProductsFetchHitEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final request = await impl.fetchHitProducts();
  }

  _productsFetchDiscountEvent(
    ProductsFetchDiscountEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final request = await impl.fetchDiscountProducts();
  }

  _productsFetchNewEvent(
    ProductsFetchNewEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final request = await impl.fetchNewProducts();
  }
}
