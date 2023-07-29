import 'dart:io';

import 'package:crave/core/providers/scroll_behavior.dart';
import 'package:crave/home/map.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RealWidget extends ConsumerStatefulWidget {
  const RealWidget({Key? key, required this.location, required this.photo})
      : super(key: key);

  final String photo;
  final LatLng location;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RealWidgetState();
}

class _RealWidgetState extends ConsumerState<RealWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Offset _offset;
  final GlobalKey _key = GlobalKey();
  bool _reverseOrder = false;

  final double _margin = 10;

  late File _photo;
  late LatLng _location;

  @override
  void initState() {
    super.initState();
    _offset = Offset(_margin, _margin);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animationController.addListener(() {
      setState(() {
        _offset = _animation.value;
      });
    });

    setState(() {
      _photo = File(widget.photo);
      _location = widget.location;
    });
    print(_location);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_reverseOrder) {
      return Center(
        child: ClipRRect(
          key: _key,
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              SizedBox(
                  height: 500,
                  width: 500,
                  child: MapSample(
                    location: _location,
                  )),
              Positioned(
                left: _offset.dx,
                top: _offset.dy,
                child: GestureDetector(
                  onTap: () {
                    setState(() => _reverseOrder = false);
                    ref.read(scrollBehaviorProvider.notifier).enable(true);
                  },
                  child: AbsorbPointer(
                    child: Transform(
                      transform: Matrix4.rotationY(0),
                      alignment: Alignment.center,
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: FractionalOffset.center,
                            image: File(_photo.path).existsSync()
                                ? FileImage(_photo)
                                : defaultTargetPlatform == TargetPlatform.iOS ||
                                        defaultTargetPlatform ==
                                            TargetPlatform.macOS
                                    ? CachedNetworkImageProvider(_photo.path)
                                        as ImageProvider
                                    : NetworkImage(_photo.path),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: ClipRRect(
          key: _key,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: FractionalOffset.center,
                image: File(_photo.path).existsSync()
                    ? FileImage(_photo)
                    : defaultTargetPlatform == TargetPlatform.iOS ||
                            defaultTargetPlatform == TargetPlatform.macOS
                        ? CachedNetworkImageProvider(_photo.path)
                            as ImageProvider
                        : NetworkImage(_photo.path),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: _offset.dx,
                  top: _offset.dy,
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _reverseOrder = true);
                      ref.read(scrollBehaviorProvider.notifier).enable(true);
                    },
                    child: AbsorbPointer(
                        child: SizedBox(
                      height: 200,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: MapSample(location: _location),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
