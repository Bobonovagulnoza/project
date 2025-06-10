sealed class ProductsEvent {}

final class ProductsFetchEvent extends ProductsEvent {}

final class ProductsFetchHitEvent extends ProductsEvent {}

final class ProductsFetchDiscountEvent extends ProductsEvent {}

final class ProductsFetchNewEvent extends ProductsEvent {}
