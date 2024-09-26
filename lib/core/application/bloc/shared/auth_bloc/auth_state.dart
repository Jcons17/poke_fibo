part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required LoadedData<User> userSession,
    required bool itWasUsedLocalAuth,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        userSession: LoadedData(),
        itWasUsedLocalAuth: false,
      );
}
