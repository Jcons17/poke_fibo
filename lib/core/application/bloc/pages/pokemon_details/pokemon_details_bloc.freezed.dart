// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonDetailsState {
  LoadedData<List<MoveExpanded>> get move => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailsStateCopyWith<PokemonDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailsStateCopyWith<$Res> {
  factory $PokemonDetailsStateCopyWith(
          PokemonDetailsState value, $Res Function(PokemonDetailsState) then) =
      _$PokemonDetailsStateCopyWithImpl<$Res, PokemonDetailsState>;
  @useResult
  $Res call({LoadedData<List<MoveExpanded>> move});
}

/// @nodoc
class _$PokemonDetailsStateCopyWithImpl<$Res, $Val extends PokemonDetailsState>
    implements $PokemonDetailsStateCopyWith<$Res> {
  _$PokemonDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? move = null,
  }) {
    return _then(_value.copyWith(
      move: null == move
          ? _value.move
          : move // ignore: cast_nullable_to_non_nullable
              as LoadedData<List<MoveExpanded>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonDetailsStateImplCopyWith<$Res>
    implements $PokemonDetailsStateCopyWith<$Res> {
  factory _$$PokemonDetailsStateImplCopyWith(_$PokemonDetailsStateImpl value,
          $Res Function(_$PokemonDetailsStateImpl) then) =
      __$$PokemonDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadedData<List<MoveExpanded>> move});
}

/// @nodoc
class __$$PokemonDetailsStateImplCopyWithImpl<$Res>
    extends _$PokemonDetailsStateCopyWithImpl<$Res, _$PokemonDetailsStateImpl>
    implements _$$PokemonDetailsStateImplCopyWith<$Res> {
  __$$PokemonDetailsStateImplCopyWithImpl(_$PokemonDetailsStateImpl _value,
      $Res Function(_$PokemonDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? move = null,
  }) {
    return _then(_$PokemonDetailsStateImpl(
      move: null == move
          ? _value.move
          : move // ignore: cast_nullable_to_non_nullable
              as LoadedData<List<MoveExpanded>>,
    ));
  }
}

/// @nodoc

class _$PokemonDetailsStateImpl implements _PokemonDetailsState {
  const _$PokemonDetailsStateImpl({required this.move});

  @override
  final LoadedData<List<MoveExpanded>> move;

  @override
  String toString() {
    return 'PokemonDetailsState(move: $move)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailsStateImpl &&
            (identical(other.move, move) || other.move == move));
  }

  @override
  int get hashCode => Object.hash(runtimeType, move);

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailsStateImplCopyWith<_$PokemonDetailsStateImpl> get copyWith =>
      __$$PokemonDetailsStateImplCopyWithImpl<_$PokemonDetailsStateImpl>(
          this, _$identity);
}

abstract class _PokemonDetailsState implements PokemonDetailsState {
  const factory _PokemonDetailsState(
          {required final LoadedData<List<MoveExpanded>> move}) =
      _$PokemonDetailsStateImpl;

  @override
  LoadedData<List<MoveExpanded>> get move;

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailsStateImplCopyWith<_$PokemonDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
