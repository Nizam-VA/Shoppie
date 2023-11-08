part of 'add_cart_bloc.dart';

class AddCartEvent {}

class AddToCartEvent extends AddCartEvent {
  final Product product;
  AddToCartEvent({required this.product});
}

class RemoveFromCartEvent extends AddCartEvent {
  final Product product;
  RemoveFromCartEvent({required this.product});
}
