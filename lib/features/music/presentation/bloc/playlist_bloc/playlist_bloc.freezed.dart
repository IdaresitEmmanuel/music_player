// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'playlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlaylistStateTearOff {
  const _$PlaylistStateTearOff();

  _PlaylistState call(
      {required List<Music> musicList, required Option<Uint8List> image}) {
    return _PlaylistState(
      musicList: musicList,
      image: image,
    );
  }
}

/// @nodoc
const $PlaylistState = _$PlaylistStateTearOff();

/// @nodoc
mixin _$PlaylistState {
  List<Music> get musicList => throw _privateConstructorUsedError;
  Option<Uint8List> get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistStateCopyWith<PlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistStateCopyWith<$Res> {
  factory $PlaylistStateCopyWith(
          PlaylistState value, $Res Function(PlaylistState) then) =
      _$PlaylistStateCopyWithImpl<$Res>;
  $Res call({List<Music> musicList, Option<Uint8List> image});
}

/// @nodoc
class _$PlaylistStateCopyWithImpl<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  _$PlaylistStateCopyWithImpl(this._value, this._then);

  final PlaylistState _value;
  // ignore: unused_field
  final $Res Function(PlaylistState) _then;

  @override
  $Res call({
    Object? musicList = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      musicList: musicList == freezed
          ? _value.musicList
          : musicList // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Option<Uint8List>,
    ));
  }
}

/// @nodoc
abstract class _$PlaylistStateCopyWith<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  factory _$PlaylistStateCopyWith(
          _PlaylistState value, $Res Function(_PlaylistState) then) =
      __$PlaylistStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Music> musicList, Option<Uint8List> image});
}

/// @nodoc
class __$PlaylistStateCopyWithImpl<$Res>
    extends _$PlaylistStateCopyWithImpl<$Res>
    implements _$PlaylistStateCopyWith<$Res> {
  __$PlaylistStateCopyWithImpl(
      _PlaylistState _value, $Res Function(_PlaylistState) _then)
      : super(_value, (v) => _then(v as _PlaylistState));

  @override
  _PlaylistState get _value => super._value as _PlaylistState;

  @override
  $Res call({
    Object? musicList = freezed,
    Object? image = freezed,
  }) {
    return _then(_PlaylistState(
      musicList: musicList == freezed
          ? _value.musicList
          : musicList // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Option<Uint8List>,
    ));
  }
}

/// @nodoc

class _$_PlaylistState implements _PlaylistState {
  const _$_PlaylistState({required this.musicList, required this.image});

  @override
  final List<Music> musicList;
  @override
  final Option<Uint8List> image;

  @override
  String toString() {
    return 'PlaylistState(musicList: $musicList, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaylistState &&
            const DeepCollectionEquality().equals(other.musicList, musicList) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(musicList),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$PlaylistStateCopyWith<_PlaylistState> get copyWith =>
      __$PlaylistStateCopyWithImpl<_PlaylistState>(this, _$identity);
}

abstract class _PlaylistState implements PlaylistState {
  const factory _PlaylistState(
      {required List<Music> musicList,
      required Option<Uint8List> image}) = _$_PlaylistState;

  @override
  List<Music> get musicList;
  @override
  Option<Uint8List> get image;
  @override
  @JsonKey(ignore: true)
  _$PlaylistStateCopyWith<_PlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}
