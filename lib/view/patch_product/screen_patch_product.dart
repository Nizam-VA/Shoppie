import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/product/bloc/product_bloc.dart';
import 'package:shoppie/core/constants.dart';
import 'package:shoppie/model/product.dart';

class ScreenPatchProduct extends StatelessWidget {
  ScreenPatchProduct({super.key, required this.product});

  final Product product;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  final descController = TextEditingController();

  initController() {
    nameController.text = product.title;
    priceController.text = product.price;
    categoryController.text = product.category;
    descController.text = product.description;
  }

  @override
  Widget build(BuildContext context) {
    initController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              kHight50,
              TextFieldWidget(nameController: nameController, label: 'Title'),
              kHight10,
              TextFieldWidget(nameController: priceController, label: 'Price'),
              kHight10,
              TextFieldWidget(
                  nameController: categoryController, label: 'Category'),
              kHight10,
              TextFieldWidget(
                  nameController: descController, label: 'Description'),
              kHight10,
              Container(
                width: double.infinity,
                height: 50,
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
                  onPressed: () {
                    final products = Product(
                      id: product.id,
                      title: nameController.text,
                      price: priceController.text,
                      description: descController.text,
                      category: categoryController.text,
                      image: product.image,
                      rating: product.rating,
                      ratingCount: product.ratingCount,
                    );
                    context
                        .read<ProductBloc>()
                        .add(PatchProductEvent(product: products));
                    Navigator.of(context).pop(products);
                  },
                  child: const Text('Patch'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.nameController,
    required this.label,
  });

  final TextEditingController nameController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
