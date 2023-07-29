// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'real_camera_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RealCameraState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CameraController cameraController) started,
    required TResult Function(XFile image) captured,
    required TResult Function(LatLng location, XFile photo) finalized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CameraController cameraController)? started,
    TResult? Function(XFile image)? captured,
    TResult? Function(LatLng location, XFile photo)? finalized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraController cameraController)? started,
    TResult Function(XFile image)? captured,
    TResult Function(LatLng location, XFile photo)? finalized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealCameraStateInitial value) initial,
    required TResult Function(_RealCameraStateStarted value) started,
    required TResult Function(_RealCameraStateCaptured value) captured,
    required TResult Function(_RealCameraStateFinalized value) finalized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealCameraStateInitial value)? initial,
    TResult? Function(_RealCameraStateStarted value)? started,
    TResult? Function(_RealCameraStateCaptured value)? captured,
    TResult? Function(_RealCameraStateFinalized value)? finalized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealCameraStateInitial value)? initial,
    TResult Function(_RealCameraStateStarted value)? started,
    TResult Function(_RealCameraStateCaptured value)? captured,
    TResult Function(_RealCameraStateFinalized value)? finalized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealCameraStateCopyWith<$Res> {
  factory $RealCameraStateCopyWith(
          RealCameraState value, $Res Function(RealCameraState) then) =
      _$RealCameraStateCopyWithImpl<$Res, RealCameraState>;
}

/// @nodoc
class _$RealCameraStateCopyWithImpl<$Res, $Val extends RealCameraState>
    implements $RealCameraStateCopyWith<$Res> {
  _$RealCameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RealCameraStateInitialCopyWith<$Res> {
  factory _$$_RealCameraStateInitialCopyWith(_$_RealCameraStateInitial value,
          $Res Function(_$_RealCameraStateInitial) then) =
      __$$_RealCameraStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RealCameraStateInitialCopyWithImpl<$Res>
    extends _$RealCameraStateCopyWithImpl<$Res, _$_RealCameraStateInitial>
    implements _$$_RealCameraStateInitialCopyWith<$Res> {
  __$$_RealCameraStateInitialCopyWithImpl(_$_RealCameraStateInitial _value,
      $Res Function(_$_RealCameraStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RealCameraStateInitial implements _RealCameraStateInitial {
  const _$_RealCameraStateInitial();

  @override
  String toString() {
    return 'RealCameraState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RealCameraStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CameraController cameraController) started,
    required TResult Function(XFile image) captured,
    required TResult Function(LatLng location, XFile photo) finalized,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CameraController cameraController)? started,
    TResult? Function(XFile image)? captured,
    TResult? Function(LatLng location, XFile photo)? finalized,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraController cameraController)? started,
    TResult Function(XFile image)? captured,
    TResult Function(LatLng location, XFile photo)? finalized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealCameraStateInitial value) initial,
    required TResult Function(_RealCameraStateStarted value) started,
    required TResult Function(_RealCameraStateCaptured value) captured,
    required TResult Function(_RealCameraStateFinalized value) finalized,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealCameraStateInitial value)? initial,
    TResult? Function(_RealCameraStateStarted value)? started,
    TResult? Function(_RealCameraStateCaptured value)? captured,
    TResult? Function(_RealCameraStateFinalized value)? finalized,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealCameraStateInitial value)? initial,
    TResult Function(_RealCameraStateStarted value)? started,
    TResult Function(_RealCameraStateCaptured value)? captured,
    TResult Function(_RealCameraStateFinalized value)? finalized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _RealCameraStateInitial implements RealCameraState {
  const factory _RealCameraStateInitial() = _$_RealCameraStateInitial;
}

/// @nodoc
abstract class _$$_RealCameraStateStartedCopyWith<$Res> {
  factory _$$_RealCameraStateStartedCopyWith(_$_RealCameraStateStarted value,
          $Res Function(_$_RealCameraStateStarted) then) =
      __$$_RealCameraStateStartedCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraController cameraController});
}

/// @nodoc
class __$$_RealCameraStateStartedCopyWithImpl<$Res>
    extends _$RealCameraStateCopyWithImpl<$Res, _$_RealCameraStateStarted>
    implements _$$_RealCameraStateStartedCopyWith<$Res> {
  __$$_RealCameraStateStartedCopyWithImpl(_$_RealCameraStateStarted _value,
      $Res Function(_$_RealCameraStateStarted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraController = null,
  }) {
    return _then(_$_RealCameraStateStarted(
      cameraController: null == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController,
    ));
  }
}

/// @nodoc

class _$_RealCameraStateStarted implements _RealCameraStateStarted {
  const _$_RealCameraStateStarted({required this.cameraController});

  @override
  final CameraController cameraController;

  @override
  String toString() {
    return 'RealCameraState.started(cameraController: $cameraController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RealCameraStateStarted &&
            (identical(other.cameraController, cameraController) ||
                other.cameraController == cameraController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RealCameraStateStartedCopyWith<_$_RealCameraStateStarted> get copyWith =>
      __$$_RealCameraStateStartedCopyWithImpl<_$_RealCameraStateStarted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CameraController cameraController) started,
    required TResult Function(XFile image) captured,
    required TResult Function(LatLng location, XFile photo) finalized,
  }) {
    return started(cameraController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CameraController cameraController)? started,
    TResult? Function(XFile image)? captured,
    TResult? Function(LatLng location, XFile photo)? finalized,
  }) {
    return started?.call(cameraController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraController cameraController)? started,
    TResult Function(XFile image)? captured,
    TResult Function(LatLng location, XFile photo)? finalized,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(cameraController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealCameraStateInitial value) initial,
    required TResult Function(_RealCameraStateStarted value) started,
    required TResult Function(_RealCameraStateCaptured value) captured,
    required TResult Function(_RealCameraStateFinalized value) finalized,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealCameraStateInitial value)? initial,
    TResult? Function(_RealCameraStateStarted value)? started,
    TResult? Function(_RealCameraStateCaptured value)? captured,
    TResult? Function(_RealCameraStateFinalized value)? finalized,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealCameraStateInitial value)? initial,
    TResult Function(_RealCameraStateStarted value)? started,
    TResult Function(_RealCameraStateCaptured value)? captured,
    TResult Function(_RealCameraStateFinalized value)? finalized,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _RealCameraStateStarted implements RealCameraState {
  const factory _RealCameraStateStarted(
          {required final CameraController cameraController}) =
      _$_RealCameraStateStarted;

  CameraController get cameraController;
  @JsonKey(ignore: true)
  _$$_RealCameraStateStartedCopyWith<_$_RealCameraStateStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RealCameraStateCapturedCopyWith<$Res> {
  factory _$$_RealCameraStateCapturedCopyWith(_$_RealCameraStateCaptured value,
          $Res Function(_$_RealCameraStateCaptured) then) =
      __$$_RealCameraStateCapturedCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image});
}

/// @nodoc
class __$$_RealCameraStateCapturedCopyWithImpl<$Res>
    extends _$RealCameraStateCopyWithImpl<$Res, _$_RealCameraStateCaptured>
    implements _$$_RealCameraStateCapturedCopyWith<$Res> {
  __$$_RealCameraStateCapturedCopyWithImpl(_$_RealCameraStateCaptured _value,
      $Res Function(_$_RealCameraStateCaptured) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_RealCameraStateCaptured(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$_RealCameraStateCaptured implements _RealCameraStateCaptured {
  const _$_RealCameraStateCaptured({required this.image});

  @override
  final XFile image;

  @override
  String toString() {
    return 'RealCameraState.captured(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RealCameraStateCaptured &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RealCameraStateCapturedCopyWith<_$_RealCameraStateCaptured>
      get copyWith =>
          __$$_RealCameraStateCapturedCopyWithImpl<_$_RealCameraStateCaptured>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CameraController cameraController) started,
    required TResult Function(XFile image) captured,
    required TResult Function(LatLng location, XFile photo) finalized,
  }) {
    return captured(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CameraController cameraController)? started,
    TResult? Function(XFile image)? captured,
    TResult? Function(LatLng location, XFile photo)? finalized,
  }) {
    return captured?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraController cameraController)? started,
    TResult Function(XFile image)? captured,
    TResult Function(LatLng location, XFile photo)? finalized,
    required TResult orElse(),
  }) {
    if (captured != null) {
      return captured(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealCameraStateInitial value) initial,
    required TResult Function(_RealCameraStateStarted value) started,
    required TResult Function(_RealCameraStateCaptured value) captured,
    required TResult Function(_RealCameraStateFinalized value) finalized,
  }) {
    return captured(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealCameraStateInitial value)? initial,
    TResult? Function(_RealCameraStateStarted value)? started,
    TResult? Function(_RealCameraStateCaptured value)? captured,
    TResult? Function(_RealCameraStateFinalized value)? finalized,
  }) {
    return captured?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealCameraStateInitial value)? initial,
    TResult Function(_RealCameraStateStarted value)? started,
    TResult Function(_RealCameraStateCaptured value)? captured,
    TResult Function(_RealCameraStateFinalized value)? finalized,
    required TResult orElse(),
  }) {
    if (captured != null) {
      return captured(this);
    }
    return orElse();
  }
}

abstract class _RealCameraStateCaptured implements RealCameraState {
  const factory _RealCameraStateCaptured({required final XFile image}) =
      _$_RealCameraStateCaptured;

  XFile get image;
  @JsonKey(ignore: true)
  _$$_RealCameraStateCapturedCopyWith<_$_RealCameraStateCaptured>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RealCameraStateFinalizedCopyWith<$Res> {
  factory _$$_RealCameraStateFinalizedCopyWith(
          _$_RealCameraStateFinalized value,
          $Res Function(_$_RealCameraStateFinalized) then) =
      __$$_RealCameraStateFinalizedCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng location, XFile photo});
}

/// @nodoc
class __$$_RealCameraStateFinalizedCopyWithImpl<$Res>
    extends _$RealCameraStateCopyWithImpl<$Res, _$_RealCameraStateFinalized>
    implements _$$_RealCameraStateFinalizedCopyWith<$Res> {
  __$$_RealCameraStateFinalizedCopyWithImpl(_$_RealCameraStateFinalized _value,
      $Res Function(_$_RealCameraStateFinalized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? photo = null,
  }) {
    return _then(_$_RealCameraStateFinalized(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$_RealCameraStateFinalized implements _RealCameraStateFinalized {
  const _$_RealCameraStateFinalized(
      {required this.location, required this.photo});

  @override
  final LatLng location;
  @override
  final XFile photo;

  @override
  String toString() {
    return 'RealCameraState.finalized(location: $location, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RealCameraStateFinalized &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RealCameraStateFinalizedCopyWith<_$_RealCameraStateFinalized>
      get copyWith => __$$_RealCameraStateFinalizedCopyWithImpl<
          _$_RealCameraStateFinalized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CameraController cameraController) started,
    required TResult Function(XFile image) captured,
    required TResult Function(LatLng location, XFile photo) finalized,
  }) {
    return finalized(location, photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CameraController cameraController)? started,
    TResult? Function(XFile image)? captured,
    TResult? Function(LatLng location, XFile photo)? finalized,
  }) {
    return finalized?.call(location, photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraController cameraController)? started,
    TResult Function(XFile image)? captured,
    TResult Function(LatLng location, XFile photo)? finalized,
    required TResult orElse(),
  }) {
    if (finalized != null) {
      return finalized(location, photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealCameraStateInitial value) initial,
    required TResult Function(_RealCameraStateStarted value) started,
    required TResult Function(_RealCameraStateCaptured value) captured,
    required TResult Function(_RealCameraStateFinalized value) finalized,
  }) {
    return finalized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealCameraStateInitial value)? initial,
    TResult? Function(_RealCameraStateStarted value)? started,
    TResult? Function(_RealCameraStateCaptured value)? captured,
    TResult? Function(_RealCameraStateFinalized value)? finalized,
  }) {
    return finalized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealCameraStateInitial value)? initial,
    TResult Function(_RealCameraStateStarted value)? started,
    TResult Function(_RealCameraStateCaptured value)? captured,
    TResult Function(_RealCameraStateFinalized value)? finalized,
    required TResult orElse(),
  }) {
    if (finalized != null) {
      return finalized(this);
    }
    return orElse();
  }
}

abstract class _RealCameraStateFinalized implements RealCameraState {
  const factory _RealCameraStateFinalized(
      {required final LatLng location,
      required final XFile photo}) = _$_RealCameraStateFinalized;

  LatLng get location;
  XFile get photo;
  @JsonKey(ignore: true)
  _$$_RealCameraStateFinalizedCopyWith<_$_RealCameraStateFinalized>
      get copyWith => throw _privateConstructorUsedError;
}
