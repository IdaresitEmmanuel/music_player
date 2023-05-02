// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equalizer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$EqualizerStateCopyWithImpl<$Res, EqualizerState>;
  @useResult
  $Res call({bool isEqualizerEnabled});
}

/// @nodoc
class _$EqualizerStateCopyWithImpl<$Res, $Val extends EqualizerState>
    implements $EqualizerStateCopyWith<$Res> {
  _$EqualizerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEqualizerEnabled = null,
  }) {
    return _then(_value.copyWith(
      isEqualizerEnabled: null == isEqualizerEnabled
          ? _value.isEqualizerEnabled
          : isEqualizerEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EqualizerStateCopyWith<$Res>
    implements $EqualizerStateCopyWith<$Res> {
  factory _$$_EqualizerStateCopyWith(
          _$_EqualizerState value, $Res Function(_$_EqualizerState) then) =
      __$$_EqualizerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEqualizerEnabled});
}

/// @nodoc
class __$$_EqualizerStateCopyWithImpl<$Res>
    extends _$EqualizerStateCopyWithImpl<$Res, _$_EqualizerState>
    implements _$$_EqualizerStateCopyWith<$Res> {
  __$$_EqualizerStateCopyWithImpl(
      _$_EqualizerState _value, $Res Function(_$_EqualizerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEqualizerEnabled = null,
  }) {
    return _then(_$_EqualizerState(
      isEqualizerEnabled: null == isEqualizerEnabled
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
            other is _$_EqualizerState &&
            (identical(other.isEqualizerEnabled, isEqualizerEnabled) ||
                other.isEqualizerEnabled == isEqualizerEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEqualizerEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EqualizerStateCopyWith<_$_EqualizerState> get copyWith =>
      __$$_EqualizerStateCopyWithImpl<_$_EqualizerState>(this, _$identity);
}

abstract class _EqualizerState implements EqualizerState {
  const factory _EqualizerState({required final bool isEqualizerEnabled}) =
      _$_EqualizerState;

  @override
  bool get isEqualizerEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_EqualizerStateCopyWith<_$_EqualizerState> get copyWith =>
      throw _privateConstructorUsedError;
}
