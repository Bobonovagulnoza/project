abstract class ProductDetailEvent {}
class FetchProductDetail extends ProductDetailEvent {
  final int id;
  FetchProductDetail(this.id);
}