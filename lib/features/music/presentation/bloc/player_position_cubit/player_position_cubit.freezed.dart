// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_position_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerPositionStateTearOff {
  const _$PlayerPositionStateTearOff();

  _PlayerPositionState call({required Duration position}) {
    return _PlayerPositionState(
      position: position,
    );
  }
}

/// @nodoc
const $PlayerPositionState = _$PlayerPositionStateTearOff();

/// @nodoc
mixin _$PlayerPositionState {
  Duration get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerPositionStateCopyWith<PlayerPositionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerPositionStateCopyWith<$Res> {
  factory $PlayerPositionStateCopyWith(
          PlayerPositionState value, $Res Function(PlayerPositionState) then) =
      _$PlayerPositionStateCopyWithImpl<$Res>;
  $Res call({Duration position});
}

/// @nodoc
class _$PlayerPositionStateCopyWithImpl<$Res>
    implements $PlayerPositionStateCopyWith<$Res> {
  _$PlayerPositionStateCopyWithImpl(this._value, this._then);

  final PlayerPositionState _value;
  // ignore: unused_field
  final $Res Function(PlayerPositionState) _then;

  @override
  $Res call({
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
abstract class _$PlayerPositionStateCopyWith<$Res>
    implements $PlayerPositionStateCopyWith<$Res> {
  factory _$PlayerPositionStateCopyWith(_PlayerPositionState value,
          $Res Function(_PlayerPositionState) then) =
      __$PlayerPositionStateCopyWithImpl<$Res>;
  @override
  $Res call({Duration position});
}

/// @nodoc
class __$PlayerPositionStateCopyWithImpl<$Res>
    extends _$PlayerPositionStateCopyWithImpl<$Res>
    implements _$PlayerPositionStateCopyWith<$Res> {
  __$PlayerPositionStateCopyWithImpl(
      _PlayerPositionState _value, $Res Function(_PlayerPositionState) _then)
      : super(_value, (v) => _then(v as _PlayerPositionState));

  @override
  _PlayerPositionState get _value => super._value as _PlayerPositionState;

  @override
  $Res call({
    Object? position = freezed,
  }) {
    return _then(_PlayerPositionState(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_PlayerPositionState implements _PlayerPositionState {
  const _$_PlayerPositionState({required this.position});

  @override
  final Duration position;

  @override
  String toString() {
    return 'PlayerPositionState(position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerPositionState &&
            const DeepCollectionEquality().equals(other.position, position));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(position));

  @JsonKey(ignore: true)
  @override
  _$PlayerPositionStateCopyWith<_PlayerPositionState> get copyWith =>
      __$PlayerPositionStateCopyWithImpl<_PlayerPositionState>(
          this, _$identity);
}

abstract class _PlayerPositionState implements PlayerPositionState {
  const factory _PlayerPositionState({required Duration position}) =
      _$_PlayerPositionState;

  @override
  Duration get position;
  @override
  @JsonKey(ignore: true)
  _$PlayerPositionStateCopyWith<_PlayerPositionState> get copyWith =>
      throw _privateConstructorUsedError;
}
