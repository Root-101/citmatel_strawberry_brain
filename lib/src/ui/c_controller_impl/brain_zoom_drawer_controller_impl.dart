import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';

class BrainZoomDrawerControllerImpl extends GetxController
    implements BrainZoomDrawerController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}
