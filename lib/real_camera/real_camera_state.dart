import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'real_camera_state.freezed.dart';

extension RealCameraGetters on RealCameraState {
  bool get isStarted => this is _RealCameraStateStarted;
  bool get isCaptured => this is _RealCameraStateCaptured;
}

@freezed
class RealCameraState with _$RealCameraState {
  const factory RealCameraState.initial() = _RealCameraStateInitial;
  const factory RealCameraState.started(
      {required CameraController cameraController}) = _RealCameraStateStarted;
  const factory RealCameraState.captured({required XFile image}) =
      _RealCameraStateCaptured;
  const factory RealCameraState.finalized(
      {required LatLng location,
      required XFile photo}) = _RealCameraStateFinalized;
}
