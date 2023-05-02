// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_position_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PlayerPositionStateCopyWithImpl<$Res, PlayerPositionState>;
  @useResult
  $Res call({Duration position});
}

/// @nodoc
class _$PlayerPositionStateCopyWithImpl<$Res, $Val extends PlayerPositionState>
    implements $PlayerPositionStateCopyWith<$Res> {
  _$PlayerPositionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerPositionStateCopyWith<$Res>
    implements $PlayerPositionStateCopyWith<$Res> {
  factory _$$_PlayerPositionStateCopyWith(_$_PlayerPositionState value,
          $Res Function(_$_PlayerPositionState) then) =
      __$$_PlayerPositionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration position});
}

/// @nodoc
class __$$_PlayerPositionStateCopyWithImpl<$Res>
    extends _$PlayerPositionStateCopyWithImpl<$Res, _$_PlayerPositionState>
    implements _$$_PlayerPositionStateCopyWith<$Res> {
  __$$_PlayerPositionStateCopyWithImpl(_$_PlayerPositionState _value,
      $Res Function(_$_PlayerPositionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$_PlayerPositionState(
      position: null == position
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
            other is _$_PlayerPositionState &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerPositionStateCopyWith<_$_PlayerPositionState> get copyWith =>
      __$$_PlayerPositionStateCopyWithImpl<_$_PlayerPositionState>(
          this, _$identity);
}

abstract class _PlayerPositionState implements PlayerPositionState {
  const factory _PlayerPositionState({required final Duration position}) =
      _$_PlayerPositionState;

  @override
  Duration get position;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerPositionStateCopyWith<_$_PlayerPositionState> get copyWith =>
      throw _privateConstructorUsedError;
}
