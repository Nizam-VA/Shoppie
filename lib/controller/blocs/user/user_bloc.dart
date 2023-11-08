import 'package:bloc/bloc.dart';
import 'package:shoppie/controller/api_services/api_sevices.dart';
import 'package:shoppie/model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserEvent>((event, emit) async {
      final user = await ApiServices().getUser();
      emit(UserState(user: user));
    });
  }
}
