part of 'add_cart_bloc.dart';

class AddCartState {
  final List<Product> products;
  AddCartState({required this.products});
}

final class AddCartInitial extends AddCartState {
  AddCartInitial() : super(products: []);
}
