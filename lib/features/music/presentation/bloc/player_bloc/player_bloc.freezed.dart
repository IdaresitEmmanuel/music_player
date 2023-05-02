// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PlayerStateCopyWithImpl<$Res, PlayerState>;
  @useResult
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
class _$PlayerStateCopyWithImpl<$Res, $Val extends PlayerState>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? queue = null,
    Object? currentIndex = null,
    Object? currentMusicId = freezed,
    Object? songDuration = null,
    Object? currentPosition = null,
    Object? bufferedPosition = null,
    Object? shuffleMode = null,
    Object? repeatMode = null,
    Object? musicArt = null,
  }) {
    return _then(_value.copyWith(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentMusicId: freezed == currentMusicId
          ? _value.currentMusicId
          : currentMusicId // ignore: cast_nullable_to_non_nullable
              as int?,
      songDuration: null == songDuration
          ? _value.songDuration
          : songDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: null == bufferedPosition
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      shuffleMode: null == shuffleMode
          ? _value.shuffleMode
          : shuffleMode // ignore: cast_nullable_to_non_nullable
              as AudioServiceShuffleMode,
      repeatMode: null == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as AudioServiceRepeatMode,
      musicArt: null == musicArt
          ? _value.musicArt
          : musicArt // ignore: cast_nullable_to_non_nullable
              as Option<Uint8List>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerStateCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$$_PlayerStateCopyWith(
          _$_PlayerState value, $Res Function(_$_PlayerState) then) =
      __$$_PlayerStateCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_PlayerStateCopyWithImpl<$Res>
    extends _$PlayerStateCopyWithImpl<$Res, _$_PlayerState>
    implements _$$_PlayerStateCopyWith<$Res> {
  __$$_PlayerStateCopyWithImpl(
      _$_PlayerState _value, $Res Function(_$_PlayerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? queue = null,
    Object? currentIndex = null,
    Object? currentMusicId = freezed,
    Object? songDuration = null,
    Object? currentPosition = null,
    Object? bufferedPosition = null,
    Object? shuffleMode = null,
    Object? repeatMode = null,
    Object? musicArt = null,
  }) {
    return _then(_$_PlayerState(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      queue: null == queue
          ? _value._queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentMusicId: freezed == currentMusicId
          ? _value.currentMusicId
          : currentMusicId // ignore: cast_nullable_to_non_nullable
              as int?,
      songDuration: null == songDuration
          ? _value.songDuration
          : songDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: null == bufferedPosition
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      shuffleMode: null == shuffleMode
          ? _value.shuffleMode
          : shuffleMode // ignore: cast_nullable_to_non_nullable
              as AudioServiceShuffleMode,
      repeatMode: null == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as AudioServiceRepeatMode,
      musicArt: null == musicArt
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
      required final List<Music> queue,
      required this.currentIndex,
      required this.currentMusicId,
      required this.songDuration,
      required this.currentPosition,
      required this.bufferedPosition,
      required this.shuffleMode,
      required this.repeatMode,
      required this.musicArt})
      : _queue = queue;

  @override
  final bool isPlaying;
  final List<Music> _queue;
  @override
  List<Music> get queue {
    if (_queue is EqualUnmodifiableListView) return _queue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queue);
  }

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
            other is _$_PlayerState &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            const DeepCollectionEquality().equals(other._queue, _queue) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.currentMusicId, currentMusicId) ||
                other.currentMusicId == currentMusicId) &&
            (identical(other.songDuration, songDuration) ||
                other.songDuration == songDuration) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.bufferedPosition, bufferedPosition) ||
                other.bufferedPosition == bufferedPosition) &&
            (identical(other.shuffleMode, shuffleMode) ||
                other.shuffleMode == shuffleMode) &&
            (identical(other.repeatMode, repeatMode) ||
                other.repeatMode == repeatMode) &&
            (identical(other.musicArt, musicArt) ||
                other.musicArt == musicArt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isPlaying,
      const DeepCollectionEquality().hash(_queue),
      currentIndex,
      currentMusicId,
      songDuration,
      currentPosition,
      bufferedPosition,
      shuffleMode,
      repeatMode,
      musicArt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerStateCopyWith<_$_PlayerState> get copyWith =>
      __$$_PlayerStateCopyWithImpl<_$_PlayerState>(this, _$identity);
}

abstract class _PlayerState implements PlayerState {
  const factory _PlayerState(
      {required final bool isPlaying,
      required final List<Music> queue,
      required final int currentIndex,
      required final int? currentMusicId,
      required final Duration songDuration,
      required final Duration currentPosition,
      required final Duration bufferedPosition,
      required final AudioServiceShuffleMode shuffleMode,
      required final AudioServiceRepeatMode repeatMode,
      required final Option<Uint8List> musicArt}) = _$_PlayerState;

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
  _$$_PlayerStateCopyWith<_$_PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
