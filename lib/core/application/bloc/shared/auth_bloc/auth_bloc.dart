import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      switch (event) {
        case MakeLogin(email: final email, code: final code):
          emit(state.copyWith(userSession: state.userSession.copyWithLoading()));
          final result = await authRepository.login(email, code);

          emit(state.copyWith(userSession: state.userSession.copyWithData(data: result)));

          return;
        case MakeSignUp(user: final user):
          emit(state.copyWith(userSession: state.userSession.copyWithLoading()));

          final result = await authRepository.signUp(user);

          emit(state.copyWith(userSession: state.userSession.copyWithData(data: result)));
          return;
        case GetSession():
          emit(state.copyWith(userSession: state.userSession.copyWithLoading()));

          final result = await authRepository.getSession();

          emit(state.copyWith(userSession: state.userSession.copyWithData(data: result)));
          return;
        case Logout():
          final result = await authRepository.logout();

          result.fold(
            (l) {},
            (r) {
              emit(
                state.copyWith(
                  userSession: LoadedData(),
                  itWasUsedLocalAuth: false,
                ),
              );
            },
          );

          return;
        case LocalAuth(bypass: final bypass):
          if (bypass) {
            emit(state.copyWith(itWasUsedLocalAuth: true));
            return;
          }

          final result = await authRepository.localAuth();

          emit(state.copyWith(itWasUsedLocalAuth: result.isRight()));

          return;
      }
    });

    getSession();
  }

  void getSession() => add(GetSession());

  void login({required String email, required String code}) {
    add(MakeLogin(email: email, code: code));
  }

  void signUp(User user) {
    add(MakeSignUp(user));
  }

  void logout() {
    add(Logout());
  }

  void localAuth(bool bypass) {
    add(LocalAuth(bypass: bypass));
  }
}
