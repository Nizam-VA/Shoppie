import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/product/bloc/product_bloc.dart';
import 'package:shoppie/core/constants.dart';
import 'package:shoppie/model/product.dart';
import 'package:shoppie/view/details/widgets/add_buy_combo.dart';
import 'package:shoppie/view/details/widgets/image_card.dart';
import 'package:shoppie/view/patch_product/screen_patch_product.dart';
import 'package:shoppie/view/update_product/screen_update_product.dart';

class ScreenDetails extends StatelessWidget {
  ScreenDetails({super.key, required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, overflow: TextOverflow.ellipsis),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              deleteProduct(context);
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ScreenPatchProduct(product: product),
                      ),
                    )
                    .then((value) => product = value);
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state.isUpdated) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Successfully Updated'),
                  backgroundColor: Colors.green,
                ));
              }
            },
            child: Column(
              children: [
                kHight50,
                ImageCard(height: height, width: width, product: product),
                kHight50,
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                kHight10,
                Text(
                  '₹ ${product.price}',
                  style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                kHight10,
                Text(
                  'Category: ${product.category}',
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
                kHight50,
                Text(
                  product.description,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  textAlign: TextAlign.justify,
                ),
                kHight100,
                AddToCartBuyNow(width: width, height: height),
                kHight20,
                Container(
                  width: width,
                  height: height * .05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: .5, color: Colors.purple),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenUpdateProduct(product: product),
                        ),
                      ).then((value) {
                        product = value;
                      });
                    },
                    child: const Text('Update Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  deleteProduct(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure to delete this product?'),
            actions: [
              TextButton(
                  onPressed: () {
                    context
                        .read<ProductBloc>()
                        .add(DeleteProductEvent(product: product));
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Delete')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'))
            ],
          );
        });
  }
}
