import '../../../../../core/error/failure_model.dart';
import '../../../data/models/products_model.dart';

sealed class ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsSuccessState extends ProductsState {
  final ProductsModel products;
  ProductsSuccessState(this.products);
}

final class ProductsFailureState extends ProductsState {
  final FailureModel error;

  ProductsFailureState(this.error);
}
