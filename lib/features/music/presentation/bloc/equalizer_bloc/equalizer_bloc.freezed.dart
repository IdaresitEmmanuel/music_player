// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'equalizer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EqualizerStateTearOff {
  const _$EqualizerStateTearOff();

  _EqualizerState call({required bool isEqualizerEnabled}) {
    return _EqualizerState(
      isEqualizerEnabled: isEqualizerEnabled,
    );
  }
}

/// @nodoc
const $EqualizerState = _$EqualizerStateTearOff();

/// @nodoc
mixin _$EqualizerState {
  bool get isEqualizerEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EqualizerStateCopyWith<EqualizerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EqualizerStateCopyWith<$Res> {
  factory $EqualizerStateCopyWith(
          EqualizerState value, $Res Function(EqualizerState) then) =
      _$EqualizerStateCopyWithImpl<$Res>;
  $Res call({bool isEqualizerEnabled});
}

/// @nodoc
class _$EqualizerStateCopyWithImpl<$Res>
    implements $EqualizerStateCopyWith<$Res> {
  _$EqualizerStateCopyWithImpl(this._value, this._then);

  final EqualizerState _value;
  // ignore: unused_field
  final $Res Function(EqualizerState) _then;

  @override
  $Res call({
    Object? isEqualizerEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      isEqualizerEnabled: isEqualizerEnabled == freezed
          ? _value.isEqualizerEnabled
          : isEqualizerEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$EqualizerStateCopyWith<$Res>
    implements $EqualizerStateCopyWith<$Res> {
  factory _$EqualizerStateCopyWith(
          _EqualizerState value, $Res Function(_EqualizerState) then) =
      __$EqualizerStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isEqualizerEnabled});
}

/// @nodoc
class __$EqualizerStateCopyWithImpl<$Res>
    extends _$EqualizerStateCopyWithImpl<$Res>
    implements _$EqualizerStateCopyWith<$Res> {
  __$EqualizerStateCopyWithImpl(
      _EqualizerState _value, $Res Function(_EqualizerState) _then)
      : super(_value, (v) => _then(v as _EqualizerState));

  @override
  _EqualizerState get _value => super._value as _EqualizerState;

  @override
  $Res call({
    Object? isEqualizerEnabled = freezed,
  }) {
    return _then(_EqualizerState(
      isEqualizerEnabled: isEqualizerEnabled == freezed
          ? _value.isEqualizerEnabled
          : isEqualizerEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EqualizerState implements _EqualizerState {
  const _$_EqualizerState({required this.isEqualizerEnabled});

  @override
  final bool isEqualizerEnabled;

  @override
  String toString() {
    return 'EqualizerState(isEqualizerEnabled: $isEqualizerEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EqualizerState &&
            const DeepCollectionEquality()
                .equals(other.isEqualizerEnabled, isEqualizerEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isEqualizerEnabled));

  @JsonKey(ignore: true)
  @override
  _$EqualizerStateCopyWith<_EqualizerState> get copyWith =>
      __$EqualizerStateCopyWithImpl<_EqualizerState>(this, _$identity);
}

abstract class _EqualizerState implements EqualizerState {
  const factory _EqualizerState({required bool isEqualizerEnabled}) =
      _$_EqualizerState;

  @override
  bool get isEqualizerEnabled;
  @override
  @JsonKey(ignore: true)
  _$EqualizerStateCopyWith<_EqualizerState> get copyWith =>
      throw _privateConstructorUsedError;
}
