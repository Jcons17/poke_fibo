part of 'sign_up_bloc.dart';

sealed class SignUpEvent {}

class SetEmailSignUp implements SignUpEvent {
  final String email;

  SetEmailSignUp({required this.email});
}

class SetCodeSignUp implements SignUpEvent {
  final String code;

  SetCodeSignUp({required this.code});
}

class SetNameSignUp implements SignUpEvent {
  final String name;

  SetNameSignUp({required this.name});
}
