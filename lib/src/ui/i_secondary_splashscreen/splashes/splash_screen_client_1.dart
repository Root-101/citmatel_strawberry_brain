import 'package:citmatel_strawberry_brain/assets/brain_assets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreenClient1 extends StatefulWidget {
  final bool mute;

  const SplashScreenClient1({
    Key? key,
    required this.mute,
  }) : super(key: key);

  @override
  _SplashScreenClient1State createState() => _SplashScreenClient1State();
}

class _SplashScreenClient1State extends State<SplashScreenClient1> {
  late VideoPlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(BrainAssets.APP_CLIENT_SPLASH_1)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          widget.mute ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? SizedBox.expand(
              child: Container(
                color: Colors.black,
                child: VideoPlayer(
                  _controller,
                ),
              ),
            )
          : Container(
              color: Colors.black,
            ),
    );
  }
}
