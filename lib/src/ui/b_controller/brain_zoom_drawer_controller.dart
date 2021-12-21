import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

abstract class BrainZoomDrawerController extends GetxController {
  void toggleDrawer();
  ZoomDrawerController get zoomDrawerController;
}
