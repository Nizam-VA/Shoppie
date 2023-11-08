import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppie/controller/blocs/user/user_bloc.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(FetchUserEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Container(
              height: 400,
              width: 300,
              color: Colors.red,
              child: Column(
                children: [Text(state.user!.username ?? '')],
              ),
            );
          },
        ),
      ),
    );
  }
}
