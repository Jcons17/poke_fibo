part of 'login_bloc.dart';

sealed class LoginEvent {}

class SetEmail implements LoginEvent {
  final String email;

  SetEmail({required this.email});
}

class SetCode implements LoginEvent {
  final String code;

  SetCode({
    required this.code,
  });
}
