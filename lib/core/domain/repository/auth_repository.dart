import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Exception, User>> login(String email, String code);

  Future<Either<Exception, User>> getSession();

  Future<Either<Exception, Unit>> logout();

  Future<Either<Exception, User>> signUp(User user);
}
