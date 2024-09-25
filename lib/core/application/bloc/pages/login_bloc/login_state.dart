part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    required String email,
    required String code,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
        email: "",
        code: "",
      );
}
