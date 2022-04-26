// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  _SearchState call(
      {required List<Music> musicList,
      required List<Artist> artistList,
      required List<Album> albumList,
      required List<Folder> folderList,
      required SearchCategory searchCategory}) {
    return _SearchState(
      musicList: musicList,
      artistList: artistList,
      albumList: albumList,
      folderList: folderList,
      searchCategory: searchCategory,
    );
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  List<Music> get musicList => throw _privateConstructorUsedError;
  List<Artist> get artistList => throw _privateConstructorUsedError;
  List<Album> get albumList => throw _privateConstructorUsedError;
  List<Folder> get folderList => throw _privateConstructorUsedError;
  SearchCategory get searchCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {List<Music> musicList,
      List<Artist> artistList,
      List<Album> albumList,
      List<Folder> folderList,
      SearchCategory searchCategory});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? musicList = freezed,
    Object? artistList = freezed,
    Object? albumList = freezed,
    Object? folderList = freezed,
    Object? searchCategory = freezed,
  }) {
    return _then(_value.copyWith(
      musicList: musicList == freezed
          ? _value.musicList
          : musicList // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      artistList: artistList == freezed
          ? _value.artistList
          : artistList // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      albumList: albumList == freezed
          ? _value.albumList
          : albumList // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      folderList: folderList == freezed
          ? _value.folderList
          : folderList // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      searchCategory: searchCategory == freezed
          ? _value.searchCategory
          : searchCategory // ignore: cast_nullable_to_non_nullable
              as SearchCategory,
    ));
  }
}

/// @nodoc
abstract class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) then) =
      __$SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Music> musicList,
      List<Artist> artistList,
      List<Album> albumList,
      List<Folder> folderList,
      SearchCategory searchCategory});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(
      _SearchState _value, $Res Function(_SearchState) _then)
      : super(_value, (v) => _then(v as _SearchState));

  @override
  _SearchState get _value => super._value as _SearchState;

  @override
  $Res call({
    Object? musicList = freezed,
    Object? artistList = freezed,
    Object? albumList = freezed,
    Object? folderList = freezed,
    Object? searchCategory = freezed,
  }) {
    return _then(_SearchState(
      musicList: musicList == freezed
          ? _value.musicList
          : musicList // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      artistList: artistList == freezed
          ? _value.artistList
          : artistList // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      albumList: albumList == freezed
          ? _value.albumList
          : albumList // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      folderList: folderList == freezed
          ? _value.folderList
          : folderList // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      searchCategory: searchCategory == freezed
          ? _value.searchCategory
          : searchCategory // ignore: cast_nullable_to_non_nullable
              as SearchCategory,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required this.musicList,
      required this.artistList,
      required this.albumList,
      required this.folderList,
      required this.searchCategory});

  @override
  final List<Music> musicList;
  @override
  final List<Artist> artistList;
  @override
  final List<Album> albumList;
  @override
  final List<Folder> folderList;
  @override
  final SearchCategory searchCategory;

  @override
  String toString() {
    return 'SearchState(musicList: $musicList, artistList: $artistList, albumList: $albumList, folderList: $folderList, searchCategory: $searchCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
            const DeepCollectionEquality().equals(other.musicList, musicList) &&
            const DeepCollectionEquality()
                .equals(other.artistList, artistList) &&
            const DeepCollectionEquality().equals(other.albumList, albumList) &&
            const DeepCollectionEquality()
                .equals(other.folderList, folderList) &&
            const DeepCollectionEquality()
                .equals(other.searchCategory, searchCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(musicList),
      const DeepCollectionEquality().hash(artistList),
      const DeepCollectionEquality().hash(albumList),
      const DeepCollectionEquality().hash(folderList),
      const DeepCollectionEquality().hash(searchCategory));

  @JsonKey(ignore: true)
  @override
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required List<Music> musicList,
      required List<Artist> artistList,
      required List<Album> albumList,
      required List<Folder> folderList,
      required SearchCategory searchCategory}) = _$_SearchState;

  @override
  List<Music> get musicList;
  @override
  List<Artist> get artistList;
  @override
  List<Album> get albumList;
  @override
  List<Folder> get folderList;
  @override
  SearchCategory get searchCategory;
  @override
  @JsonKey(ignore: true)
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
