import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

@LazySingleton(
  as: AuthRepository,
)
class AuthRepositoryImpl implements AuthRepository {
  final SharedPreferences sharedPreferences;

  static const USER_LOGIN_KEY = "user_login";
  static const LIST_USERS_KEY = "list_users";

  AuthRepositoryImpl({
    required this.sharedPreferences,
  });

  @override
  Future<Either<Exception, User>> login(String email, String code) async {
    try {
      final allUsers = sharedPreferences.getStringList(LIST_USERS_KEY);

      if (allUsers == null && allUsers?.isEmpty == true) return left(Exception("There is no users, please make a sign up."));

      final usersMapped = allUsers!.map(
        (e) => UserDto.fromMap(jsonDecode(e)),
      );

      final userLogged = usersMapped.firstWhereOrNull(
        (element) => element.email == email && element.code == code,
      );

      if (userLogged == null)
        return left(Exception("There is no user with this email or code, please check if the email or code are correct."));

      final isLogged = await sharedPreferences.setString(USER_LOGIN_KEY, userLogged.toJson());

      if (isLogged == false) return left(Exception("There has been an error making the login, please try again"));

      return right(userLogged);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, Unit>> logout() async {
    try {
      final result = await sharedPreferences.remove(USER_LOGIN_KEY);

      if (result == false) return left(Exception("There has been an error making the logout. please try again"));

      return right(unit);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, User>> signUp(User user) async {
    try {
      final allUsers = sharedPreferences.getStringList(LIST_USERS_KEY);

      final usersMapped = allUsers?.map(
        (e) => UserDto.fromMap(jsonDecode(e)),
      );

      final userLogged = usersMapped?.firstWhereOrNull(
        (element) => element.email == user.email,
      );

      if (userLogged != null) {
        return left(Exception("There is already a user with this email. Please try another email"));
      }

      final newListUsers = [...?usersMapped, user]
          .map(
            (e) => e.toJson(),
          )
          .toList();

      await sharedPreferences.setStringList(LIST_USERS_KEY, newListUsers);

      final isLogged = await sharedPreferences.setString(USER_LOGIN_KEY, user.toJson());

      if (isLogged == false) return left(Exception("There has been an error making the login, please try again"));

      return right(user);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, User>> getSession() async {
    try {
      final userLoggin = sharedPreferences.getString(USER_LOGIN_KEY);

      if (userLoggin == null) return left(Exception("There is no session active"));

      return right(UserDto.fromJson(userLoggin));
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, Unit>> localAuth() async {
    final LocalAuthentication auth = LocalAuthentication();

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    if (canAuthenticate == false) return right(unit);

    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        authMessages: [
          AndroidAuthMessages(
            signInTitle: 'Wee need your biometric for security reasons',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (didAuthenticate == false) return left(Exception("There has been an error auth"));

      return right(unit);
    } on Exception catch (e) {
      return left(e);
    }
  }
}
