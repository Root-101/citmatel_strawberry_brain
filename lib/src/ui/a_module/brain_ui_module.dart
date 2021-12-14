import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:get/get.dart';

class BrainUIModule {
  static void init() {
    TriviaUIModule.init();
    HangManUIModule.init();

    Get.put<BrainZoomDrawerController>(BrainZoomDrawerControllerImpl());
  }
}
