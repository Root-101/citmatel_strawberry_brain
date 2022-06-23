import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:get/get.dart';

class BrainVibrationControllerImpl extends BrainVibrationController {
  BrainVibrationUseCase vibrationUseCase;

  BrainVibrationControllerImpl({required this.vibrationUseCase}) {
    Get.put(
      isVibration(),
      tag: "vibration",
    );
  }

  bool changeValue() {
    bool changed = vibrationUseCase.changeValue();
    update();
    return changed;
  }

  bool isVibration() => vibrationUseCase.read();
}
