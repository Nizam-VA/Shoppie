import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/product/bloc/product_bloc.dart';
import 'package:shoppie/core/constants.dart';
import 'package:shoppie/view/details/screen_details.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.isDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product deleted Successfully.'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenDetails(product: state.products[index]),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: height / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: .75),
                      ),
                      child: Column(
                        children: [
                          kHight20,
                          Container(
                            width: width * .2,
                            height: height * .09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(state.products[index].image),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          kHight20,
                          Text(
                            state.products[index].title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          kHight10,
                          Text(
                            "₹ ${state.products[index].price}",
                            style: TextStyle(color: Colors.green[900]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
