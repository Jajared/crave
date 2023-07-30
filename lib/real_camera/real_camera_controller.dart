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
    print("taking picture");
    final image = await _controller.takePicture();
    state = RealCameraState.captured(image: image);
    print("picture taken");
    final cameras = await availableCameras();
    _controller = CameraController(
        cameras.firstWhere((description) =>
            description.lensDirection == CameraLensDirection.front),
        ResolutionPreset.high);
    await _controller.initialize();
    _controller.setZoomLevel(await _controller.getMinZoomLevel());
    _controller.setFlashMode(FlashMode.off);
    print("getting location");
    Position position = await _determinePosition();
    state = RealCameraState.finalized(
        location: LatLng(position.latitude, position.longitude), photo: image);
    print("yayz");
  }

  void dispose() {
    _controller.stopImageStream();
    _controller.dispose();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
