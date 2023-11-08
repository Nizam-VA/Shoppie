part of 'user_bloc.dart';

class UserState {
  User user;
  UserState({required this.user});
}

final class UserInitial extends UserState {
  UserInitial()
      : super(
            user: User(
          id: 0,
          email: '',
          username: '',
          password: '',
          name: '',
          phone: '',
        ));
}
