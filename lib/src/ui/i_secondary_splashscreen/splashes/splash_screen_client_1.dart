import 'package:citmatel_strawberry_brain/assets/brain_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreenClient1 extends StatefulWidget {
  const SplashScreenClient1({Key? key}) : super(key: key);

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
