import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) {
      switch (event) {
        case SetEmail(email: final email):
          emit(state.copyWith(email: email));
          return;
        case SetCode(code: final code):
          emit(state.copyWith(code: code));
          return;
      }
    });
  }

  void setEmail(String email) {
    add(SetEmail(email: email));
  }

  void setCode(String value) {
    add(SetCode(code: value));
  }
}
