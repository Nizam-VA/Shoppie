import 'package:bloc/bloc.dart';
import 'package:shoppie/model/product.dart';

part 'add_cart_event.dart';
part 'add_cart_state.dart';

class AddCartBloc extends Bloc<AddCartEvent, AddCartState> {
  final List<Product> products = [];
  AddCartBloc() : super(AddCartInitial()) {
    on<AddToCartEvent>((event, emit) {
      if (!products.contains(event.product)) {
        print(products.contains(event.product));
        products.add(event.product);
      } else {
        products.remove(event.product);
      }
      emit(AddCartState(products: products));
    });
  }
}
