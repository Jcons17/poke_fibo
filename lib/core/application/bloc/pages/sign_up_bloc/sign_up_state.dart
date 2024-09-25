part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState({
    required String email,
    required String code,
    required String name,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(email: "", code: "", name: "");

  User? get user {
    if (email.isEmpty) return null;

    if (code.isEmpty) return null;

    if (name.isEmpty) return null;

    return UserDto(code: code, email: email, name: name);
  }
}
