part of 'product_bloc.dart';

class ProductState {
  final List<Product> products;
  final List<String> categories;
  bool isLoading;
  bool isUpdated;
  bool isDeleted;
  ProductState({
    required this.categories,
    required this.products,
    this.isLoading = false,
    this.isUpdated = false,
    this.isDeleted = false,
  });
}

class ProductInitial extends ProductState {
  ProductInitial() : super(products: [], categories: []);
}
