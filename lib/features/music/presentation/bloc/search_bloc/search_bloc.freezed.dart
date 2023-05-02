// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {List<Music> musicList,
      List<Artist> artistList,
      List<Album> albumList,
      List<Folder> folderList,
      SearchCategory searchCategory});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicList = null,
    Object? artistList = null,
    Object? albumList = null,
    Object? folderList = null,
    Object? searchCategory = null,
  }) {
    return _then(_value.copyWith(
      musicList: null == musicList
          ? _value.musicList
          : musicList // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      artistList: null == artistList
          ? _value.artistList
          : artistList // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      albumList: null == albumList
          ? _value.albumList
          : albumList // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      folderList: null == folderList
          ? _value.folderList
          : folderList // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      searchCategory: null == searchCategory
          ? _value.searchCategory
          : searchCategory // ignore: cast_nullable_to_non_nullable
              as SearchCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Music> musicList,
      List<Artist> artistList,
      List<Album> albumList,
      List<Folder> folderList,
      SearchCategory searchCategory});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicList = null,
    Object? artistList = null,
    Object? albumList = null,
    Object? folderList = null,
    Object? searchCategory = null,
  }) {
    return _then(_$_SearchState(
      musicList: null == musicList
          ? _value._musicList
          : musicList // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      artistList: null == artistList
          ? _value._artistList
          : artistList // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      albumList: null == albumList
          ? _value._albumList
          : albumList // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      folderList: null == folderList
          ? _value._folderList
          : folderList // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      searchCategory: null == searchCategory
          ? _value.searchCategory
          : searchCategory // ignore: cast_nullable_to_non_nullable
              as SearchCategory,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required final List<Music> musicList,
      required final List<Artist> artistList,
      required final List<Album> albumList,
      required final List<Folder> folderList,
      required this.searchCategory})
      : _musicList = musicList,
        _artistList = artistList,
        _albumList = albumList,
        _folderList = folderList;

  final List<Music> _musicList;
  @override
  List<Music> get musicList {
    if (_musicList is EqualUnmodifiableListView) return _musicList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_musicList);
  }

  final List<Artist> _artistList;
  @override
  List<Artist> get artistList {
    if (_artistList is EqualUnmodifiableListView) return _artistList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artistList);
  }

  final List<Album> _albumList;
  @override
  List<Album> get albumList {
    if (_albumList is EqualUnmodifiableListView) return _albumList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albumList);
  }

  final List<Folder> _folderList;
  @override
  List<Folder> get folderList {
    if (_folderList is EqualUnmodifiableListView) return _folderList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_folderList);
  }

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
            other is _$_SearchState &&
            const DeepCollectionEquality()
                .equals(other._musicList, _musicList) &&
            const DeepCollectionEquality()
                .equals(other._artistList, _artistList) &&
            const DeepCollectionEquality()
                .equals(other._albumList, _albumList) &&
            const DeepCollectionEquality()
                .equals(other._folderList, _folderList) &&
            (identical(other.searchCategory, searchCategory) ||
                other.searchCategory == searchCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_musicList),
      const DeepCollectionEquality().hash(_artistList),
      const DeepCollectionEquality().hash(_albumList),
      const DeepCollectionEquality().hash(_folderList),
      searchCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final List<Music> musicList,
      required final List<Artist> artistList,
      required final List<Album> albumList,
      required final List<Folder> folderList,
      required final SearchCategory searchCategory}) = _$_SearchState;

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
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
