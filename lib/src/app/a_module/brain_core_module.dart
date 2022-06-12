import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:get/get.dart';

class BrainCoreModule {
  static Future init() async {
    await KeyValueCoreModule.init();

    Get.put<BrainHintUseCase>(BrainHintUseCaseImpl(BrainHints.hints));
    Get.put<BrainMuteUseCase>(BrainMuteUseCaseImpl());
    Get.put<BrainVibrationUseCase>(BrainVibrationUseCaseImpl());
  }
}
