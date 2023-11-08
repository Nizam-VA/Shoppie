import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoppie/controller/blocs/add_cart/bloc/add_cart_bloc.dart';
import 'package:shoppie/model/product.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.height,
    required this.width,
    required this.product,
  });

  final double height;
  final double width;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .25,
      decoration: BoxDecoration(
          border: Border.all(width: .6),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: width,
              height: height * .2,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 4,
            child: IconButton(
              onPressed: () {
                context.read<AddCartBloc>().add(
                      AddToCartEvent(product: product),
                    );
              },
              icon: const Icon(
                Icons.favorite_border,
                size: 30,
              ),
            ),
          ),
          Positioned(
              top: 15,
              left: 12,
              child: RatingBarIndicator(
                  itemSize: 15,
                  rating: double.parse(product.rating),
                  itemBuilder: (context, _) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  }))
        ],
      ),
    );
  }
}
