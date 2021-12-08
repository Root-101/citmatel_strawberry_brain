import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:get/get.dart';

class BrainUIModule {
  static void init() {
    TriviaUIModule.init();

    Get.put<BrainZoomDrawerController>(BrainZoomDrawerControllerImpl());
  }
}
