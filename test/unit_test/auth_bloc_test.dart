import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock.mocks.dart';

void main() {
  late final MockAuthRepository authRepository;
  late final AuthBloc authBloc;
  setUpAll(
    () {
      authRepository = MockAuthRepository();

      authBloc = AuthBloc(authRepository: authRepository);
    },
  );

  group('AuthBloc test', () {
    blocTest(
      'test login flow',
      build: () => authBloc,
      setUp: () => when(authRepository.login(emailMock, codeMock)).thenAnswer(
        (realInvocation) async => Right(
          UserDto(
            code: codeMock,
            email: emailMock,
            name: "Julio",
          ),
        ),
      ),
      act: (bloc) => bloc.login(email: emailMock, code: codeMock),
      wait: const Duration(milliseconds: 300),
      verify: (bloc) => verify(authRepository.login(emailMock, codeMock)).called(1),
      expect: () => [
        predicate(
          (AuthState p0) => p0.userSession.loading,
        ),
        predicate(
          (AuthState p0) => p0.userSession.value?.email == emailMock,
        ),
      ],
    );

    blocTest(
      'test login flow',
      build: () => authBloc,
      setUp: () => when(authRepository.login(emailMock, codeMock)).thenAnswer(
        (realInvocation) async => Right(
          UserDto(
            code: codeMock,
            email: emailMock,
            name: "Julio",
          ),
        ),
      ),
      act: (bloc) => bloc.login(email: emailMock, code: codeMock),
      wait: const Duration(milliseconds: 300),
      verify: (bloc) => verify(authRepository.login(emailMock, codeMock)).called(1),
      expect: () => [
        predicate(
          (AuthState p0) => p0.userSession.loading,
        ),
        predicate(
          (AuthState p0) => p0.userSession.value?.email == emailMock,
        ),
      ],
    );
  });
}

String get codeMock => "000000";

String get emailMock => "jconscalderon@gmail.com";
