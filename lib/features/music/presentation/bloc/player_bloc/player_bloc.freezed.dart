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
      required int currentIndex,
      required int? currentMusicId,
      required Duration songDuration,
      required Duration currentPosition,
      required Duration bufferedPosition,
      required AudioServiceShuffleMode shuffleMode,
      required AudioServiceRepeatMode repeatMode,
      required Option<Uint8List> musicArt}) {
    return _PlayerState(
      isPlaying: isPlaying,
      queue: queue,
      currentIndex: currentIndex,
      currentMusicId: currentMusicId,
      songDuration: songDuration,
      currentPosition: currentPosition,
      bufferedPosition: bufferedPosition,
      shuffleMode: shuffleMode,
      repeatMode: repeatMode,
      musicArt: musicArt,
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
  int? get currentMusicId => throw _privateConstructorUsedError;
  Duration get songDuration => throw _privateConstructorUsedError;
  Duration get currentPosition => throw _privateConstructorUsedError;
  Duration get bufferedPosition => throw _privateConstructorUsedError;
  AudioServiceShuffleMode get shuffleMode => throw _privateConstructorUsedError;
  AudioServiceRepeatMode get repeatMode => throw _privateConstructorUsedError;
  Option<Uint8List> get musicArt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res>;
  $Res call(
      {bool isPlaying,
      List<Music> queue,
      int currentIndex,
      int? currentMusicId,
      Duration songDuration,
      Duration currentPosition,
      Duration bufferedPosition,
      AudioServiceShuffleMode shuffleMode,
      AudioServiceRepeatMode repeatMode,
      Option<Uint8List> musicArt});
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
    Object? currentMusicId = freezed,
    Object? songDuration = freezed,
    Object? currentPosition = freezed,
    Object? bufferedPosition = freezed,
    Object? shuffleMode = freezed,
    Object? repeatMode = freezed,
    Object? musicArt = freezed,
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
      currentMusicId: currentMusicId == freezed
          ? _value.currentMusicId
          : currentMusicId // ignore: cast_nullable_to_non_nullable
              as int?,
      songDuration: songDuration == freezed
          ? _value.songDuration
          : songDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentPosition: currentPosition == freezed
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: bufferedPosition == freezed
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      shuffleMode: shuffleMode == freezed
          ? _value.shuffleMode
          : shuffleMode // ignore: cast_nullable_to_non_nullable
              as AudioServiceShuffleMode,
      repeatMode: repeatMode == freezed
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as AudioServiceRepeatMode,
      musicArt: musicArt == freezed
          ? _value.musicArt
          : musicArt // ignore: cast_nullable_to_non_nullable
              as Option<Uint8List>,
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
  $Res call(
      {bool isPlaying,
      List<Music> queue,
      int currentIndex,
      int? currentMusicId,
      Duration songDuration,
      Duration currentPosition,
      Duration bufferedPosition,
      AudioServiceShuffleMode shuffleMode,
      AudioServiceRepeatMode repeatMode,
      Option<Uint8List> musicArt});
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
    Object? currentMusicId = freezed,
    Object? songDuration = freezed,
    Object? currentPosition = freezed,
    Object? bufferedPosition = freezed,
    Object? shuffleMode = freezed,
    Object? repeatMode = freezed,
    Object? musicArt = freezed,
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
      currentMusicId: currentMusicId == freezed
          ? _value.currentMusicId
          : currentMusicId // ignore: cast_nullable_to_non_nullable
              as int?,
      songDuration: songDuration == freezed
          ? _value.songDuration
          : songDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentPosition: currentPosition == freezed
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: bufferedPosition == freezed
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      shuffleMode: shuffleMode == freezed
          ? _value.shuffleMode
          : shuffleMode // ignore: cast_nullable_to_non_nullable
              as AudioServiceShuffleMode,
      repeatMode: repeatMode == freezed
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as AudioServiceRepeatMode,
      musicArt: musicArt == freezed
          ? _value.musicArt
          : musicArt // ignore: cast_nullable_to_non_nullable
              as Option<Uint8List>,
    ));
  }
}

/// @nodoc

class _$_PlayerState implements _PlayerState {
  const _$_PlayerState(
      {required this.isPlaying,
      required this.queue,
      required this.currentIndex,
      required this.currentMusicId,
      required this.songDuration,
      required this.currentPosition,
      required this.bufferedPosition,
      required this.shuffleMode,
      required this.repeatMode,
      required this.musicArt});

  @override
  final bool isPlaying;
  @override
  final List<Music> queue;
  @override
  final int currentIndex;
  @override
  final int? currentMusicId;
  @override
  final Duration songDuration;
  @override
  final Duration currentPosition;
  @override
  final Duration bufferedPosition;
  @override
  final AudioServiceShuffleMode shuffleMode;
  @override
  final AudioServiceRepeatMode repeatMode;
  @override
  final Option<Uint8List> musicArt;

  @override
  String toString() {
    return 'PlayerState(isPlaying: $isPlaying, queue: $queue, currentIndex: $currentIndex, currentMusicId: $currentMusicId, songDuration: $songDuration, currentPosition: $currentPosition, bufferedPosition: $bufferedPosition, shuffleMode: $shuffleMode, repeatMode: $repeatMode, musicArt: $musicArt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerState &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying) &&
            const DeepCollectionEquality().equals(other.queue, queue) &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex) &&
            const DeepCollectionEquality()
                .equals(other.currentMusicId, currentMusicId) &&
            const DeepCollectionEquality()
                .equals(other.songDuration, songDuration) &&
            const DeepCollectionEquality()
                .equals(other.currentPosition, currentPosition) &&
            const DeepCollectionEquality()
                .equals(other.bufferedPosition, bufferedPosition) &&
            const DeepCollectionEquality()
                .equals(other.shuffleMode, shuffleMode) &&
            const DeepCollectionEquality()
                .equals(other.repeatMode, repeatMode) &&
            const DeepCollectionEquality().equals(other.musicArt, musicArt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isPlaying),
      const DeepCollectionEquality().hash(queue),
      const DeepCollectionEquality().hash(currentIndex),
      const DeepCollectionEquality().hash(currentMusicId),
      const DeepCollectionEquality().hash(songDuration),
      const DeepCollectionEquality().hash(currentPosition),
      const DeepCollectionEquality().hash(bufferedPosition),
      const DeepCollectionEquality().hash(shuffleMode),
      const DeepCollectionEquality().hash(repeatMode),
      const DeepCollectionEquality().hash(musicArt));

  @JsonKey(ignore: true)
  @override
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      __$PlayerStateCopyWithImpl<_PlayerState>(this, _$identity);
}

abstract class _PlayerState implements PlayerState {
  const factory _PlayerState(
      {required bool isPlaying,
      required List<Music> queue,
      required int currentIndex,
      required int? currentMusicId,
      required Duration songDuration,
      required Duration currentPosition,
      required Duration bufferedPosition,
      required AudioServiceShuffleMode shuffleMode,
      required AudioServiceRepeatMode repeatMode,
      required Option<Uint8List> musicArt}) = _$_PlayerState;

  @override
  bool get isPlaying;
  @override
  List<Music> get queue;
  @override
  int get currentIndex;
  @override
  int? get currentMusicId;
  @override
  Duration get songDuration;
  @override
  Duration get currentPosition;
  @override
  Duration get bufferedPosition;
  @override
  AudioServiceShuffleMode get shuffleMode;
  @override
  AudioServiceRepeatMode get repeatMode;
  @override
  Option<Uint8List> get musicArt;
  @override
  @JsonKey(ignore: true)
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
