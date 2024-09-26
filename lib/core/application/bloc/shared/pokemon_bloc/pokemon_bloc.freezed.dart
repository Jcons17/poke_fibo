// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonState {
  LoadedData<List<Pokemon>> get myPokemons =>
      throw _privateConstructorUsedError;
  LoadedData<List<Pokemon>> get allPokemons =>
      throw _privateConstructorUsedError;
  LoadedData<List<Pokemon>> get addPokemonToMyTeam =>
      throw _privateConstructorUsedError;
  LoadedData<Unit> get deletePokemonToMyTeam =>
      throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStateCopyWith<PokemonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStateCopyWith<$Res> {
  factory $PokemonStateCopyWith(
          PokemonState value, $Res Function(PokemonState) then) =
      _$PokemonStateCopyWithImpl<$Res, PokemonState>;
  @useResult
  $Res call(
      {LoadedData<List<Pokemon>> myPokemons,
      LoadedData<List<Pokemon>> allPokemons,
      LoadedData<List<Pokemon>> addPokemonToMyTeam,
      LoadedData<Unit> deletePokemonToMyTeam,
      int offset});
}

/// @nodoc
class _$PokemonStateCopyWithImpl<$Res, $Val extends PokemonState>
    implements $PokemonStateCopyWith<$Res> {
  _$PokemonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myPokemons = null,
    Object? allPokemons = null,
    Object? addPokemonToMyTeam = null,
    Object? deletePokemonToMyTeam = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      myPokemons: null == myPokemons
          ? _value.myPokemons
          : myPokemons // ignore: cast_nullable_to_non_nullable
              as LoadedData<List<Pokemon>>,
      allPokemons: null == allPokemons
          ? _value.allPokemons
          : allPokemons // ignore: cast_nullable_to_non_nullable
              as LoadedData<List<Pokemon>>,
      addPokemonToMyTeam: null == addPokemonToMyTeam
          ? _value.addPokemonToMyTeam
          : addPokemonToMyTeam // ignore: cast_nullable_to_non_nullable
              as LoadedData<List<Pokemon>>,
      deletePokemonToMyTeam: null == deletePokemonToMyTeam
          ? _value.deletePokemonToMyTeam
          : deletePokemonToMyTeam // ignore: cast_nullable_to_non_nullable
              as LoadedData<Unit>,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonStateImplCopyWith<$Res>
    implements $PokemonStateCopyWith<$Res> {
  factory _$$PokemonStateImplCopyWith(
          _$PokemonStateImpl value, $Res Function(_$PokemonStateImpl) then) =
      __$$PokemonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadedData<List<Pokemon>> myPokemons,
      LoadedData<List<Pokemon>> allPokemons,
      LoadedData<List<Pokemon>> addPokemonToMyTeam,
      LoadedData<Unit> deletePokemonToMyTeam,
      int offset});
}

/// @nodoc
class __$$PokemonStateImplCopyWithImpl<$Res>
    extends _$PokemonStateCopyWithImpl<$Res, _$PokemonStateImpl>
    implements _$$PokemonStateImplCopyWith<$Res> {
  __$$PokemonStateImplCopyWithImpl(
      _$PokemonStateImpl _value, $Res Function(_$PokemonStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myPokemons = null,
    Object? allPokemons = null,
    Object? addPokemonToMyTeam = null,
    Object? deletePokemonToMyTeam = null,
    Object? offset = null,
  }) {
    return _then(_$PokemonStateImpl(
      myPokemons: null == myPokemons
          ? _value.myPokemons
          : myPokemons // ignore: cast_nullable_to_non_nullable
              as LoadedData<List<Pokemon>>,
      allPokemons: null == allPokemons
          ? _value.allPokemons
          : allPokemons // ignore: cast_nullable_to_non_nullable
              as LoadedData<List<Pokemon>>,
      addPokemonToMyTeam: null == addPokemonToMyTeam
          ? _value.addPokemonToMyTeam
          : addPokemonToMyTeam // ignore: cast_nullable_to_non_nullable
              as LoadedData<List<Pokemon>>,
      deletePokemonToMyTeam: null == deletePokemonToMyTeam
          ? _value.deletePokemonToMyTeam
          : deletePokemonToMyTeam // ignore: cast_nullable_to_non_nullable
              as LoadedData<Unit>,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PokemonStateImpl extends _PokemonState {
  const _$PokemonStateImpl(
      {required this.myPokemons,
      required this.allPokemons,
      required this.addPokemonToMyTeam,
      required this.deletePokemonToMyTeam,
      required this.offset})
      : super._();

  @override
  final LoadedData<List<Pokemon>> myPokemons;
  @override
  final LoadedData<List<Pokemon>> allPokemons;
  @override
  final LoadedData<List<Pokemon>> addPokemonToMyTeam;
  @override
  final LoadedData<Unit> deletePokemonToMyTeam;
  @override
  final int offset;

  @override
  String toString() {
    return 'PokemonState(myPokemons: $myPokemons, allPokemons: $allPokemons, addPokemonToMyTeam: $addPokemonToMyTeam, deletePokemonToMyTeam: $deletePokemonToMyTeam, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStateImpl &&
            (identical(other.myPokemons, myPokemons) ||
                other.myPokemons == myPokemons) &&
            (identical(other.allPokemons, allPokemons) ||
                other.allPokemons == allPokemons) &&
            (identical(other.addPokemonToMyTeam, addPokemonToMyTeam) ||
                other.addPokemonToMyTeam == addPokemonToMyTeam) &&
            (identical(other.deletePokemonToMyTeam, deletePokemonToMyTeam) ||
                other.deletePokemonToMyTeam == deletePokemonToMyTeam) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myPokemons, allPokemons,
      addPokemonToMyTeam, deletePokemonToMyTeam, offset);

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStateImplCopyWith<_$PokemonStateImpl> get copyWith =>
      __$$PokemonStateImplCopyWithImpl<_$PokemonStateImpl>(this, _$identity);
}

abstract class _PokemonState extends PokemonState {
  const factory _PokemonState(
      {required final LoadedData<List<Pokemon>> myPokemons,
      required final LoadedData<List<Pokemon>> allPokemons,
      required final LoadedData<List<Pokemon>> addPokemonToMyTeam,
      required final LoadedData<Unit> deletePokemonToMyTeam,
      required final int offset}) = _$PokemonStateImpl;
  const _PokemonState._() : super._();

  @override
  LoadedData<List<Pokemon>> get myPokemons;
  @override
  LoadedData<List<Pokemon>> get allPokemons;
  @override
  LoadedData<List<Pokemon>> get addPokemonToMyTeam;
  @override
  LoadedData<Unit> get deletePokemonToMyTeam;
  @override
  int get offset;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStateImplCopyWith<_$PokemonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
