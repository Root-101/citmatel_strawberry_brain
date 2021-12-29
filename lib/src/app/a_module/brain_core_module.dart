import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:get/get.dart';

class BrainCoreModule {
  static void init() {
    Get.put<BrainHintUseCase>(BrainHintUseCaseImpl(BrainHints.hints));
  }
}
