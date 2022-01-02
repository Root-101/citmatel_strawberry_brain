import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class SecondarySplashScreen extends StatefulWidget {
  final Future future;
  final Widget mainApp;
  final List<SingleSplashModel> splashes;

  SecondarySplashScreen({
    required this.future,
    required this.mainApp,
    required this.splashes,
    Key? key,
  }) : super(key: key);

  @override
  _SecondarySplashScreenState createState() => _SecondarySplashScreenState();
}

class _SecondarySplashScreenState extends State<SecondarySplashScreen> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, AsyncSnapshot snapshot) {
        if (done && snapshot.connectionState == ConnectionState.done) {
          return FadeIn(
            child: widget.mainApp,
          );
        } else {
          return _buildBody(
              snapshot.connectionState == ConnectionState.waiting);
        }
      },
    );
  }

  _buildBody(bool waiting) {
    var current = widget.splashes[_currentPageNotifier.value];
    return CountdownTimer(
      controller: CountdownTimerController(
        endTime: DateTime.now()
            .add(Duration(seconds: current.duration))
            .millisecondsSinceEpoch,
        onEnd: _nextSplash,
      ),
      endWidget: Container(),
      widgetBuilder: (_, __) {
        return MaterialApp(
          home: Scaffold(
            body: Stack(
              children: <Widget>[
                _buildCurrentSplash(current.splash),
                _buildCircleIndicator(),
                if (!waiting) _buildSkip(),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildSkip() {
    return Positioned(
      right: 10.0,
      bottom: 10.0,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            done = true;
          });
        },
        child: Text("skip"),
      ),
    );
  }

  _nextSplash() {
    if (_currentPageNotifier.value >= widget.splashes.length - 1) {
      setState(() {
        done = true;
      });
    } else {
      setState(() {
        int next = _currentPageNotifier.value + 1;
        _currentPageNotifier.value = next;
      });
    }
  }

  _buildCurrentSplash(Widget currentSplash) {
    return GestureDetector(
      onTap: _nextSplash,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: currentSplash,
      ),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          size: 10,
          selectedSize: 12,
          itemCount: widget.splashes.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}
