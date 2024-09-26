import 'package:flutter_template/core/application/bloc/bloc.dart';
import 'package:flutter_template/core/domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@GenerateNiceMocks(
  [
    MockSpec<SharedPreferences>(),
    MockSpec<PokeRepository>(),
    MockSpec<AuthRepository>(),
    MockSpec<http.Client>(),
  ],
)
void mocks() {}
