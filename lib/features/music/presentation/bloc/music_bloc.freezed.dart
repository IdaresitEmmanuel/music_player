// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'music_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MusicStateTearOff {
  const _$MusicStateTearOff();

  _MusicState call(
      {required bool isMusicLoading,
      required bool isArtistLoading,
      required bool isAlbumLoading,
      required bool isFolderLoading,
      required Option<Either<Failure, List<Music>>> musicFailureOrSuccess,
      required Option<Either<Failure, List<Artist>>> artistFailureOrSuccess,
      required Option<Either<Failure, List<Album>>> albumFailureOrSuccess,
      required Option<Either<Failure, List<Folder>>> folderFailureOrSuccess}) {
    return _MusicState(
      isMusicLoading: isMusicLoading,
      isArtistLoading: isArtistLoading,
      isAlbumLoading: isAlbumLoading,
      isFolderLoading: isFolderLoading,
      musicFailureOrSuccess: musicFailureOrSuccess,
      artistFailureOrSuccess: artistFailureOrSuccess,
      albumFailureOrSuccess: albumFailureOrSuccess,
      folderFailureOrSuccess: folderFailureOrSuccess,
    );
  }
}

/// @nodoc
const $MusicState = _$MusicStateTearOff();

/// @nodoc
mixin _$MusicState {
  bool get isMusicLoading => throw _privateConstructorUsedError;
  bool get isArtistLoading => throw _privateConstructorUsedError;
  bool get isAlbumLoading => throw _privateConstructorUsedError;
  bool get isFolderLoading => throw _privateConstructorUsedError;
  Option<Either<Failure, List<Music>>> get musicFailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<Failure, List<Artist>>> get artistFailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<Failure, List<Album>>> get albumFailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<Failure, List<Folder>>> get folderFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MusicStateCopyWith<MusicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicStateCopyWith<$Res> {
  factory $MusicStateCopyWith(
          MusicState value, $Res Function(MusicState) then) =
      _$MusicStateCopyWithImpl<$Res>;
  $Res call(
      {bool isMusicLoading,
      bool isArtistLoading,
      bool isAlbumLoading,
      bool isFolderLoading,
      Option<Either<Failure, List<Music>>> musicFailureOrSuccess,
      Option<Either<Failure, List<Artist>>> artistFailureOrSuccess,
      Option<Either<Failure, List<Album>>> albumFailureOrSuccess,
      Option<Either<Failure, List<Folder>>> folderFailureOrSuccess});
}

/// @nodoc
class _$MusicStateCopyWithImpl<$Res> implements $MusicStateCopyWith<$Res> {
  _$MusicStateCopyWithImpl(this._value, this._then);

  final MusicState _value;
  // ignore: unused_field
  final $Res Function(MusicState) _then;

  @override
  $Res call({
    Object? isMusicLoading = freezed,
    Object? isArtistLoading = freezed,
    Object? isAlbumLoading = freezed,
    Object? isFolderLoading = freezed,
    Object? musicFailureOrSuccess = freezed,
    Object? artistFailureOrSuccess = freezed,
    Object? albumFailureOrSuccess = freezed,
    Object? folderFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      isMusicLoading: isMusicLoading == freezed
          ? _value.isMusicLoading
          : isMusicLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isArtistLoading: isArtistLoading == freezed
          ? _value.isArtistLoading
          : isArtistLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlbumLoading: isAlbumLoading == freezed
          ? _value.isAlbumLoading
          : isAlbumLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFolderLoading: isFolderLoading == freezed
          ? _value.isFolderLoading
          : isFolderLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      musicFailureOrSuccess: musicFailureOrSuccess == freezed
          ? _value.musicFailureOrSuccess
          : musicFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Music>>>,
      artistFailureOrSuccess: artistFailureOrSuccess == freezed
          ? _value.artistFailureOrSuccess
          : artistFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Artist>>>,
      albumFailureOrSuccess: albumFailureOrSuccess == freezed
          ? _value.albumFailureOrSuccess
          : albumFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Album>>>,
      folderFailureOrSuccess: folderFailureOrSuccess == freezed
          ? _value.folderFailureOrSuccess
          : folderFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Folder>>>,
    ));
  }
}

/// @nodoc
abstract class _$MusicStateCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory _$MusicStateCopyWith(
          _MusicState value, $Res Function(_MusicState) then) =
      __$MusicStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isMusicLoading,
      bool isArtistLoading,
      bool isAlbumLoading,
      bool isFolderLoading,
      Option<Either<Failure, List<Music>>> musicFailureOrSuccess,
      Option<Either<Failure, List<Artist>>> artistFailureOrSuccess,
      Option<Either<Failure, List<Album>>> albumFailureOrSuccess,
      Option<Either<Failure, List<Folder>>> folderFailureOrSuccess});
}

/// @nodoc
class __$MusicStateCopyWithImpl<$Res> extends _$MusicStateCopyWithImpl<$Res>
    implements _$MusicStateCopyWith<$Res> {
  __$MusicStateCopyWithImpl(
      _MusicState _value, $Res Function(_MusicState) _then)
      : super(_value, (v) => _then(v as _MusicState));

  @override
  _MusicState get _value => super._value as _MusicState;

  @override
  $Res call({
    Object? isMusicLoading = freezed,
    Object? isArtistLoading = freezed,
    Object? isAlbumLoading = freezed,
    Object? isFolderLoading = freezed,
    Object? musicFailureOrSuccess = freezed,
    Object? artistFailureOrSuccess = freezed,
    Object? albumFailureOrSuccess = freezed,
    Object? folderFailureOrSuccess = freezed,
  }) {
    return _then(_MusicState(
      isMusicLoading: isMusicLoading == freezed
          ? _value.isMusicLoading
          : isMusicLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isArtistLoading: isArtistLoading == freezed
          ? _value.isArtistLoading
          : isArtistLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlbumLoading: isAlbumLoading == freezed
          ? _value.isAlbumLoading
          : isAlbumLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFolderLoading: isFolderLoading == freezed
          ? _value.isFolderLoading
          : isFolderLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      musicFailureOrSuccess: musicFailureOrSuccess == freezed
          ? _value.musicFailureOrSuccess
          : musicFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Music>>>,
      artistFailureOrSuccess: artistFailureOrSuccess == freezed
          ? _value.artistFailureOrSuccess
          : artistFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Artist>>>,
      albumFailureOrSuccess: albumFailureOrSuccess == freezed
          ? _value.albumFailureOrSuccess
          : albumFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Album>>>,
      folderFailureOrSuccess: folderFailureOrSuccess == freezed
          ? _value.folderFailureOrSuccess
          : folderFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<Folder>>>,
    ));
  }
}

/// @nodoc

class _$_MusicState implements _MusicState {
  const _$_MusicState(
      {required this.isMusicLoading,
      required this.isArtistLoading,
      required this.isAlbumLoading,
      required this.isFolderLoading,
      required this.musicFailureOrSuccess,
      required this.artistFailureOrSuccess,
      required this.albumFailureOrSuccess,
      required this.folderFailureOrSuccess});

  @override
  final bool isMusicLoading;
  @override
  final bool isArtistLoading;
  @override
  final bool isAlbumLoading;
  @override
  final bool isFolderLoading;
  @override
  final Option<Either<Failure, List<Music>>> musicFailureOrSuccess;
  @override
  final Option<Either<Failure, List<Artist>>> artistFailureOrSuccess;
  @override
  final Option<Either<Failure, List<Album>>> albumFailureOrSuccess;
  @override
  final Option<Either<Failure, List<Folder>>> folderFailureOrSuccess;

  @override
  String toString() {
    return 'MusicState(isMusicLoading: $isMusicLoading, isArtistLoading: $isArtistLoading, isAlbumLoading: $isAlbumLoading, isFolderLoading: $isFolderLoading, musicFailureOrSuccess: $musicFailureOrSuccess, artistFailureOrSuccess: $artistFailureOrSuccess, albumFailureOrSuccess: $albumFailureOrSuccess, folderFailureOrSuccess: $folderFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MusicState &&
            const DeepCollectionEquality()
                .equals(other.isMusicLoading, isMusicLoading) &&
            const DeepCollectionEquality()
                .equals(other.isArtistLoading, isArtistLoading) &&
            const DeepCollectionEquality()
                .equals(other.isAlbumLoading, isAlbumLoading) &&
            const DeepCollectionEquality()
                .equals(other.isFolderLoading, isFolderLoading) &&
            const DeepCollectionEquality()
                .equals(other.musicFailureOrSuccess, musicFailureOrSuccess) &&
            const DeepCollectionEquality()
                .equals(other.artistFailureOrSuccess, artistFailureOrSuccess) &&
            const DeepCollectionEquality()
                .equals(other.albumFailureOrSuccess, albumFailureOrSuccess) &&
            const DeepCollectionEquality()
                .equals(other.folderFailureOrSuccess, folderFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isMusicLoading),
      const DeepCollectionEquality().hash(isArtistLoading),
      const DeepCollectionEquality().hash(isAlbumLoading),
      const DeepCollectionEquality().hash(isFolderLoading),
      const DeepCollectionEquality().hash(musicFailureOrSuccess),
      const DeepCollectionEquality().hash(artistFailureOrSuccess),
      const DeepCollectionEquality().hash(albumFailureOrSuccess),
      const DeepCollectionEquality().hash(folderFailureOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$MusicStateCopyWith<_MusicState> get copyWith =>
      __$MusicStateCopyWithImpl<_MusicState>(this, _$identity);
}

abstract class _MusicState implements MusicState {
  const factory _MusicState(
      {required bool isMusicLoading,
      required bool isArtistLoading,
      required bool isAlbumLoading,
      required bool isFolderLoading,
      required Option<Either<Failure, List<Music>>> musicFailureOrSuccess,
      required Option<Either<Failure, List<Artist>>> artistFailureOrSuccess,
      required Option<Either<Failure, List<Album>>> albumFailureOrSuccess,
      required Option<Either<Failure, List<Folder>>>
          folderFailureOrSuccess}) = _$_MusicState;

  @override
  bool get isMusicLoading;
  @override
  bool get isArtistLoading;
  @override
  bool get isAlbumLoading;
  @override
  bool get isFolderLoading;
  @override
  Option<Either<Failure, List<Music>>> get musicFailureOrSuccess;
  @override
  Option<Either<Failure, List<Artist>>> get artistFailureOrSuccess;
  @override
  Option<Either<Failure, List<Album>>> get albumFailureOrSuccess;
  @override
  Option<Either<Failure, List<Folder>>> get folderFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$MusicStateCopyWith<_MusicState> get copyWith =>
      throw _privateConstructorUsedError;
}
