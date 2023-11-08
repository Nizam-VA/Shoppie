import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/product/bloc/product_bloc.dart';
import 'package:shoppie/core/constants.dart';

class ChoiceChipsList extends StatelessWidget {
  const ChoiceChipsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.isLoading ? 4 : state.categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return ChoiceChip(
              selected: false,
              showCheckmark: false,
              selectedColor: Colors.purple,
              label: Text(state.isLoading
                  ? 'Category $index'
                  : state.categories[index]),
              onSelected: (selected) {
                context.read<ProductBloc>().add(
                    FetchByCategoryEvent(category: state.categories[index]));
              },
            );
          }),
          separatorBuilder: (context, index) {
            return kWidth10;
          },
        );
      },
    );
  }
}
