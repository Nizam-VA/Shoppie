import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:shoppie/view/cart/screen_cart.dart';
import 'package:shoppie/view/home/screen_home.dart';
import 'package:shoppie/view/profile/screen_profile.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List screens = [
    ScreenHome(),
    const ScreenCart(),
    const ScreenProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.value,
            onTap: (value) {
              context.read<BottomNavigationBloc>().add(
                    BottomNavigationValueChangeEvent(value: value),
                  );
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
