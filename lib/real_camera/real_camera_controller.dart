import 'package:crave/real_camera/real_camera_state.dart';
import 'package:camera/camera.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'real_camera_controller.g.dart';

@riverpod
class RealCameraController extends _$RealCameraController {
  late CameraController _controller;

  @override
  RealCameraState build() {
    return const RealCameraState.initial();
  }

  void init() async {
    final cameras = await availableCameras();
    _controller = CameraController(
        cameras.firstWhere((description) =>
            description.lensDirection == CameraLensDirection.back),
        ResolutionPreset.high);
    await _controller.initialize();
    _controller.setZoomLevel(await _controller.getMinZoomLevel());
    state = RealCameraState.started(cameraController: _controller);
  }

  void takePhoto() async {
    final image = await _controller.takePicture();
    state = RealCameraState.captured(image: image);

    final cameras = await availableCameras();
    _controller = CameraController(
        cameras.firstWhere((description) =>
            description.lensDirection == CameraLensDirection.front),
        ResolutionPreset.high);
    await _controller.initialize();
    _controller.setZoomLevel(await _controller.getMinZoomLevel());
    _controller.setFlashMode(FlashMode.off);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    state = RealCameraState.finalized(
        location: LatLng(position.latitude, position.longitude), photo: image);
  }

  void dispose() {
    _controller.stopImageStream();
    _controller.dispose();
  }
}
