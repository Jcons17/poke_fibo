import 'package:flutter_template/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock.mocks.dart';

void main() {
  late final AuthRepositoryImpl authRepository;

  late final MockSharedPreferences sharedPreferences;

  setUpAll(
    () {
      sharedPreferences = MockSharedPreferences();

      authRepository = AuthRepositoryImpl(sharedPreferences: sharedPreferences);
    },
  );

  group('AuthRepository test', () {
    test('make login ok', () async {
      final jsonParticular = UserDto(code: "000000", email: "jconscalderon@gmail.com", name: "Julio Cons").toJson();

      when(
        sharedPreferences.getStringList(AuthRepositoryImpl.LIST_USERS_KEY),
      ).thenAnswer(
        (realInvocation) => [
          jsonParticular,
        ],
      );

      when(
        sharedPreferences.setString(AuthRepositoryImpl.USER_LOGIN_KEY, jsonParticular),
      ).thenAnswer(
        (realInvocation) async => true,
      );

      final result = await authRepository.login("jconscalderon@gmail.com", "000000");

      verify(
        sharedPreferences.setString(AuthRepositoryImpl.USER_LOGIN_KEY, jsonParticular),
      ).called(1);

      expect(
        result.fold(
          (l) => null,
          (r) => r,
        ),
        isA<User>(),
      );
    });

    test('get session ok', () async {
      final jsonParticular = UserDto(code: "000000", email: "jconscalderon@gmail.com", name: "Julio Cons").toJson();

      when(
        sharedPreferences.getString(AuthRepositoryImpl.USER_LOGIN_KEY),
      ).thenAnswer(
        (realInvocation) => jsonParticular,
      );

      final result = await authRepository.getSession();

      expect(
        result.fold(
          (l) => null,
          (r) => r,
        ),
        isA<User>(),
      );
    });
  });
}
