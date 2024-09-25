part of 'auth_bloc.dart';

sealed class AuthEvent {}

class MakeLogin implements AuthEvent {
  final String email;
  final String code;

  MakeLogin({required this.email, required this.code});
}

class MakeSignUp implements AuthEvent {
  final User user;

  MakeSignUp(this.user);
}

class GetSession implements AuthEvent {}

class Logout implements AuthEvent {}

class PutFinger implements AuthEvent {}

class PutCode implements AuthEvent {}
