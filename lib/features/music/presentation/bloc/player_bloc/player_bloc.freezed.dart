// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerStateTearOff {
  const _$PlayerStateTearOff();

  _PlayerState call(
      {required bool isPlaying,
      required List<Music> queue,
      required int currentIndex}) {
    return _PlayerState(
      isPlaying: isPlaying,
      queue: queue,
      currentIndex: currentIndex,
    );
  }
}

/// @nodoc
const $PlayerState = _$PlayerStateTearOff();

/// @nodoc
mixin _$PlayerState {
  bool get isPlaying => throw _privateConstructorUsedError;
  List<Music> get queue => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res>;
  $Res call({bool isPlaying, List<Music> queue, int currentIndex});
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res> implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  final PlayerState _value;
  // ignore: unused_field
  final $Res Function(PlayerState) _then;

  @override
  $Res call({
    Object? isPlaying = freezed,
    Object? queue = freezed,
    Object? currentIndex = freezed,
  }) {
    return _then(_value.copyWith(
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      queue: queue == freezed
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PlayerStateCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$PlayerStateCopyWith(
          _PlayerState value, $Res Function(_PlayerState) then) =
      __$PlayerStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isPlaying, List<Music> queue, int currentIndex});
}

/// @nodoc
class __$PlayerStateCopyWithImpl<$Res> extends _$PlayerStateCopyWithImpl<$Res>
    implements _$PlayerStateCopyWith<$Res> {
  __$PlayerStateCopyWithImpl(
      _PlayerState _value, $Res Function(_PlayerState) _then)
      : super(_value, (v) => _then(v as _PlayerState));

  @override
  _PlayerState get _value => super._value as _PlayerState;

  @override
  $Res call({
    Object? isPlaying = freezed,
    Object? queue = freezed,
    Object? currentIndex = freezed,
  }) {
    return _then(_PlayerState(
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      queue: queue == freezed
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PlayerState implements _PlayerState {
  const _$_PlayerState(
      {required this.isPlaying,
      required this.queue,
      required this.currentIndex});

  @override
  final bool isPlaying;
  @override
  final List<Music> queue;
  @override
  final int currentIndex;

  @override
  String toString() {
    return 'PlayerState(isPlaying: $isPlaying, queue: $queue, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerState &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying) &&
            const DeepCollectionEquality().equals(other.queue, queue) &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isPlaying),
      const DeepCollectionEquality().hash(queue),
      const DeepCollectionEquality().hash(currentIndex));

  @JsonKey(ignore: true)
  @override
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      __$PlayerStateCopyWithImpl<_PlayerState>(this, _$identity);
}

abstract class _PlayerState implements PlayerState {
  const factory _PlayerState(
      {required bool isPlaying,
      required List<Music> queue,
      required int currentIndex}) = _$_PlayerState;

  @override
  bool get isPlaying;
  @override
  List<Music> get queue;
  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
