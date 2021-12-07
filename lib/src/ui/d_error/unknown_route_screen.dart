import 'package:flutter/material.dart';

class UnknownRouteScreen extends StatelessWidget {
  static const ROUTE_NAME = "/unknown-route-screen";

  final String unknownRoute;

  const UnknownRouteScreen({Key? key, this.unknownRoute = "unknown"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404, route: $unknownRoute"),
      ),
      body: Center(
        child: Text("Error 404: page \'$unknownRoute\'not found"),
      ),
    );
  }
}
