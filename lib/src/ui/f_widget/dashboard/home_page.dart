import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static final ROUTE_NAME = "/";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BrainZoomDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: BrainDrawer(),
        mainScreen: DashBoard(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        style: DrawerStyle.Style1,
        backgroundColor: Colors.grey[400]!,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
    );
  }
}
