// Mocks generated by Mockito 5.4.0 from annotations
// in music_player/test/features/music/data/datasources/search_data_sources/search_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i2;
import 'package:speech_to_text/speech_to_text.dart' as _i4;
import 'package:speech_to_text_platform_interface/speech_to_text_platform_interface.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i2.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
      ) as Set<String>);
  @override
  Object? get(String? key) => (super.noSuchMethod(Invocation.method(
        #get,
        [key],
      )) as Object?);
  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);
  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);
  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);
  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);
  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);
  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);
  @override
  _i3.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [SpeechToText].
///
/// See the documentation for Mockito's code generation for more information.
class MockSpeechToText extends _i1.Mock implements _i4.SpeechToText {
  MockSpeechToText() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set errorListener(_i4.SpeechErrorListener? _errorListener) =>
      super.noSuchMethod(
        Invocation.setter(
          #errorListener,
          _errorListener,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set statusListener(_i4.SpeechStatusListener? _statusListener) =>
      super.noSuchMethod(
        Invocation.setter(
          #statusListener,
          _statusListener,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasRecognized => (super.noSuchMethod(
        Invocation.getter(#hasRecognized),
        returnValue: false,
      ) as bool);
  @override
  String get lastRecognizedWords => (super.noSuchMethod(
        Invocation.getter(#lastRecognizedWords),
        returnValue: '',
      ) as String);
  @override
  String get lastStatus => (super.noSuchMethod(
        Invocation.getter(#lastStatus),
        returnValue: '',
      ) as String);
  @override
  double get lastSoundLevel => (super.noSuchMethod(
        Invocation.getter(#lastSoundLevel),
        returnValue: 0.0,
      ) as double);
  @override
  bool get isAvailable => (super.noSuchMethod(
        Invocation.getter(#isAvailable),
        returnValue: false,
      ) as bool);
  @override
  bool get isListening => (super.noSuchMethod(
        Invocation.getter(#isListening),
        returnValue: false,
      ) as bool);
  @override
  bool get isNotListening => (super.noSuchMethod(
        Invocation.getter(#isNotListening),
        returnValue: false,
      ) as bool);
  @override
  bool get hasError => (super.noSuchMethod(
        Invocation.getter(#hasError),
        returnValue: false,
      ) as bool);
  @override
  _i3.Future<bool> get hasPermission => (super.noSuchMethod(
        Invocation.getter(#hasPermission),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> initialize({
    _i4.SpeechErrorListener? onError,
    _i4.SpeechStatusListener? onStatus,
    dynamic debugLogging = false,
    Duration? finalTimeout = const Duration(milliseconds: 2000),
    List<_i5.SpeechConfigOption>? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #initialize,
          [],
          {
            #onError: onError,
            #onStatus: onStatus,
            #debugLogging: debugLogging,
            #finalTimeout: finalTimeout,
            #options: options,
          },
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<void> stop() => (super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> cancel() => (super.noSuchMethod(
        Invocation.method(
          #cancel,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<dynamic> listen({
    _i4.SpeechResultListener? onResult,
    Duration? listenFor,
    Duration? pauseFor,
    String? localeId,
    _i4.SpeechSoundLevelChange? onSoundLevelChange,
    dynamic cancelOnError = false,
    dynamic partialResults = true,
    dynamic onDevice = false,
    _i4.ListenMode? listenMode = _i4.ListenMode.confirmation,
    dynamic sampleRate = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [],
          {
            #onResult: onResult,
            #listenFor: listenFor,
            #pauseFor: pauseFor,
            #localeId: localeId,
            #onSoundLevelChange: onSoundLevelChange,
            #cancelOnError: cancelOnError,
            #partialResults: partialResults,
            #onDevice: onDevice,
            #listenMode: listenMode,
            #sampleRate: sampleRate,
          },
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  _i3.Future<List<_i4.LocaleName>> locales() => (super.noSuchMethod(
        Invocation.method(
          #locales,
          [],
        ),
        returnValue: _i3.Future<List<_i4.LocaleName>>.value(<_i4.LocaleName>[]),
      ) as _i3.Future<List<_i4.LocaleName>>);
  @override
  _i3.Future<_i4.LocaleName?> systemLocale() => (super.noSuchMethod(
        Invocation.method(
          #systemLocale,
          [],
        ),
        returnValue: _i3.Future<_i4.LocaleName?>.value(),
      ) as _i3.Future<_i4.LocaleName?>);
}
