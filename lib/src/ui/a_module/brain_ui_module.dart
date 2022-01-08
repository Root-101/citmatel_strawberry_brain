import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:get/get.dart';

class BrainUIModule {
  static void init() {
    BrainCoreModule.init();

    TriviaUIModule.init();
    HangManUIModule.init();
    DnDUIModule.init();

    Get.put<BrainZoomDrawerController>(BrainZoomDrawerControllerImpl());
    Get.put<BrainRandomController>(BrainRandomControllerImpl());
  }
}
