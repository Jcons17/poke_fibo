part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required LoadedData<User> userSession,
    required bool itWasUsedCode,
    required bool itWasUsedFinger,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        userSession: LoadedData(),
        itWasUsedCode: false,
        itWasUsedFinger: false,
      );
}
