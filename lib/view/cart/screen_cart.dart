import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/add_cart/bloc/add_cart_bloc.dart';
import 'package:shoppie/core/constants.dart';
import 'package:shoppie/view/details/widgets/image_card.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: BlocBuilder<AddCartBloc, AddCartState>(
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return ImageCard(
                    height: height,
                    width: width,
                    product: state.products[index]);
              },
              separatorBuilder: (context, index) {
                return kHight10;
              },
              itemCount: state.products.length);
        },
      ),
    );
  }
}
