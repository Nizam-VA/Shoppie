import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/product/bloc/product_bloc.dart';
import 'package:shoppie/view/home/widgets/choice_chips_list.dart';
import 'package:shoppie/view/home/widgets/products_grid_view.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<ProductBloc>().add(FetchAllProductsEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoppie'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              context.read<ProductBloc>().add(FetchAllProductsEvent());
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: height * .08,
            child: const ChoiceChipsList(),
          ),
          const Text(
            'All Products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: ProductsGridView(height: height, width: width),
          ),
        ],
      ),
    );
  }
}
