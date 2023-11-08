import 'package:bloc/bloc.dart';
import 'package:shoppie/controller/api_services/api_sevices.dart';
import 'package:shoppie/model/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchAllProductsEvent>((event, emit) async {
      emit(ProductState(products: [], categories: [], isLoading: true));
      final categories = await ApiServices().getAllCategories();
      print(categories);
      final productList = await ApiServices().fetchAllProducts();
      emit(ProductState(
          products: productList, categories: categories, isLoading: false));
    });

    on<FetchByCategoryEvent>((event, emit) async {
      emit(ProductState(categories: [], products: [], isLoading: true));
      final productList = await ApiServices().fetchByCategory(event.category);
      final categories = await ApiServices().getAllCategories();
      emit(ProductState(
          categories: categories, products: productList, isLoading: false));
    });

    on<UpdateProductEvent>((event, emit) async {
      final response = await ApiServices().updateProduct(event.product);
      final categories = await ApiServices().getAllCategories();
      final productList = await ApiServices().fetchAllProducts();
      emit(ProductState(
          categories: categories, products: productList, isUpdated: response));
    });

    on<PatchProductEvent>((event, emit) async {
      final response = await ApiServices().updateProduct(event.product);
      final categories = await ApiServices().getAllCategories();
      final productList = await ApiServices().fetchAllProducts();
      emit(ProductState(
          categories: categories, products: productList, isUpdated: response));
    });

    on<DeleteProductEvent>((event, emit) async {
      final response = await ApiServices().deleteProduct(event.product.id);
      print(response);
      final categories = await ApiServices().getAllCategories();
      final productList = [...await ApiServices().fetchAllProducts()];
      productList.remove(event.product);
      print(productList);
      emit(ProductState(
          categories: categories, products: productList, isDeleted: true));
    });
  }
}
