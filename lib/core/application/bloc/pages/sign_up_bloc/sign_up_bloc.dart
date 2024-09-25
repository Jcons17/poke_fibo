import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    on<SignUpEvent>((event, emit) {
      switch (event) {
        case SetEmailSignUp(email: final email):
          emit(state.copyWith(email: email));
          return;
        case SetCodeSignUp(code: final code):
          emit(state.copyWith(code: code));
          return;
        case SetNameSignUp(name: final name):
          emit(state.copyWith(name: name));
          return;
      }
    });
  }

  void setName(String value) {}

  void setEmail(String value) {}
}
