import 'dart:convert';

import 'package:flutter_template/core/domain/domain.dart';

class UserDto implements User {
  @override
  final String code;

  @override
  final String email;

  @override
  final String name;
  UserDto({
    required this.code,
    required this.email,
    required this.name,
  });

  UserDto copyWith({
    String? code,
    String? email,
    String? name,
  }) {
    return UserDto(
      code: code ?? this.code,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'email': email,
      'name': name,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      code: map['code'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) => UserDto.fromMap(json.decode(source));

  @override
  String toString() => 'UserDto(code: $code, email: $email, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDto && other.code == code && other.email == email && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ email.hashCode ^ name.hashCode;
}
