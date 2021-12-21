import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';

class BrainZoomDrawerControllerImpl extends BrainZoomDrawerController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}
