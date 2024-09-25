// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  LoadedData<User> get userSession => throw _privateConstructorUsedError;
  bool get itWasUsedCode => throw _privateConstructorUsedError;
  bool get itWasUsedFinger => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {LoadedData<User> userSession, bool itWasUsedCode, bool itWasUsedFinger});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSession = null,
    Object? itWasUsedCode = null,
    Object? itWasUsedFinger = null,
  }) {
    return _then(_value.copyWith(
      userSession: null == userSession
          ? _value.userSession
          : userSession // ignore: cast_nullable_to_non_nullable
              as LoadedData<User>,
      itWasUsedCode: null == itWasUsedCode
          ? _value.itWasUsedCode
          : itWasUsedCode // ignore: cast_nullable_to_non_nullable
              as bool,
      itWasUsedFinger: null == itWasUsedFinger
          ? _value.itWasUsedFinger
          : itWasUsedFinger // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadedData<User> userSession, bool itWasUsedCode, bool itWasUsedFinger});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSession = null,
    Object? itWasUsedCode = null,
    Object? itWasUsedFinger = null,
  }) {
    return _then(_$AuthStateImpl(
      userSession: null == userSession
          ? _value.userSession
          : userSession // ignore: cast_nullable_to_non_nullable
              as LoadedData<User>,
      itWasUsedCode: null == itWasUsedCode
          ? _value.itWasUsedCode
          : itWasUsedCode // ignore: cast_nullable_to_non_nullable
              as bool,
      itWasUsedFinger: null == itWasUsedFinger
          ? _value.itWasUsedFinger
          : itWasUsedFinger // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {required this.userSession,
      required this.itWasUsedCode,
      required this.itWasUsedFinger});

  @override
  final LoadedData<User> userSession;
  @override
  final bool itWasUsedCode;
  @override
  final bool itWasUsedFinger;

  @override
  String toString() {
    return 'AuthState(userSession: $userSession, itWasUsedCode: $itWasUsedCode, itWasUsedFinger: $itWasUsedFinger)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.userSession, userSession) ||
                other.userSession == userSession) &&
            (identical(other.itWasUsedCode, itWasUsedCode) ||
                other.itWasUsedCode == itWasUsedCode) &&
            (identical(other.itWasUsedFinger, itWasUsedFinger) ||
                other.itWasUsedFinger == itWasUsedFinger));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userSession, itWasUsedCode, itWasUsedFinger);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final LoadedData<User> userSession,
      required final bool itWasUsedCode,
      required final bool itWasUsedFinger}) = _$AuthStateImpl;

  @override
  LoadedData<User> get userSession;
  @override
  bool get itWasUsedCode;
  @override
  bool get itWasUsedFinger;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
