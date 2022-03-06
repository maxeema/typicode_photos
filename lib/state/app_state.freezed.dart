// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateInfoTearOff {
  const _$AppStateInfoTearOff();

  _AppStateInfo call({bool? initialized, int? lastPhotoId}) {
    return _AppStateInfo(
      initialized: initialized,
      lastPhotoId: lastPhotoId,
    );
  }
}

/// @nodoc
const $AppStateInfo = _$AppStateInfoTearOff();

/// @nodoc
mixin _$AppStateInfo {
  bool? get initialized => throw _privateConstructorUsedError;
  int? get lastPhotoId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateInfoCopyWith<AppStateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateInfoCopyWith<$Res> {
  factory $AppStateInfoCopyWith(
          AppStateInfo value, $Res Function(AppStateInfo) then) =
      _$AppStateInfoCopyWithImpl<$Res>;
  $Res call({bool? initialized, int? lastPhotoId});
}

/// @nodoc
class _$AppStateInfoCopyWithImpl<$Res> implements $AppStateInfoCopyWith<$Res> {
  _$AppStateInfoCopyWithImpl(this._value, this._then);

  final AppStateInfo _value;
  // ignore: unused_field
  final $Res Function(AppStateInfo) _then;

  @override
  $Res call({
    Object? initialized = freezed,
    Object? lastPhotoId = freezed,
  }) {
    return _then(_value.copyWith(
      initialized: initialized == freezed
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPhotoId: lastPhotoId == freezed
          ? _value.lastPhotoId
          : lastPhotoId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$AppStateInfoCopyWith<$Res>
    implements $AppStateInfoCopyWith<$Res> {
  factory _$AppStateInfoCopyWith(
          _AppStateInfo value, $Res Function(_AppStateInfo) then) =
      __$AppStateInfoCopyWithImpl<$Res>;
  @override
  $Res call({bool? initialized, int? lastPhotoId});
}

/// @nodoc
class __$AppStateInfoCopyWithImpl<$Res> extends _$AppStateInfoCopyWithImpl<$Res>
    implements _$AppStateInfoCopyWith<$Res> {
  __$AppStateInfoCopyWithImpl(
      _AppStateInfo _value, $Res Function(_AppStateInfo) _then)
      : super(_value, (v) => _then(v as _AppStateInfo));

  @override
  _AppStateInfo get _value => super._value as _AppStateInfo;

  @override
  $Res call({
    Object? initialized = freezed,
    Object? lastPhotoId = freezed,
  }) {
    return _then(_AppStateInfo(
      initialized: initialized == freezed
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPhotoId: lastPhotoId == freezed
          ? _value.lastPhotoId
          : lastPhotoId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_AppStateInfo implements _AppStateInfo {
  const _$_AppStateInfo({this.initialized, this.lastPhotoId});

  @override
  final bool? initialized;
  @override
  final int? lastPhotoId;

  @override
  String toString() {
    return 'AppStateInfo(initialized: $initialized, lastPhotoId: $lastPhotoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppStateInfo &&
            const DeepCollectionEquality()
                .equals(other.initialized, initialized) &&
            const DeepCollectionEquality()
                .equals(other.lastPhotoId, lastPhotoId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initialized),
      const DeepCollectionEquality().hash(lastPhotoId));

  @JsonKey(ignore: true)
  @override
  _$AppStateInfoCopyWith<_AppStateInfo> get copyWith =>
      __$AppStateInfoCopyWithImpl<_AppStateInfo>(this, _$identity);
}

abstract class _AppStateInfo implements AppStateInfo {
  const factory _AppStateInfo({bool? initialized, int? lastPhotoId}) =
      _$_AppStateInfo;

  @override
  bool? get initialized;
  @override
  int? get lastPhotoId;
  @override
  @JsonKey(ignore: true)
  _$AppStateInfoCopyWith<_AppStateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
