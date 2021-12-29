import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: widget.splashes[0].splash,
            ),
          ); //SecondarySplash mientras carga
        } else {
          return widget.mainApp; //app como tal una vez que carga
        }
      },
    );
  }
}
