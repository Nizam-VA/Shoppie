import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/add_cart/bloc/add_cart_bloc.dart';
import 'package:shoppie/controller/blocs/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:shoppie/controller/blocs/product/bloc/product_bloc.dart';
import 'package:shoppie/controller/blocs/user/user_bloc.dart';
import 'package:shoppie/view/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => AddCartBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MainPage(),
      ),
    );
  }
}
