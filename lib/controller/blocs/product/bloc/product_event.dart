part of 'product_bloc.dart';

class ProductEvent {}

class FetchAllProductsEvent extends ProductEvent {}

class FetchByCategoryEvent extends ProductEvent {
  final String category;
  FetchByCategoryEvent({required this.category});
}

class UpdateProductEvent extends ProductEvent {
  final Product product;
  UpdateProductEvent({required this.product});
}

class PatchProductEvent extends ProductEvent {
  final Product product;
  PatchProductEvent({required this.product});
}

class DeleteProductEvent extends ProductEvent {
  final Product product;
  DeleteProductEvent({required this.product});
}
