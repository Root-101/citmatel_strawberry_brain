import 'package:citmatel_strawberry_brain/brain_exporter.dart';

class BrainMuteControllerImpl extends BrainMuteController {
  BrainMuteUseCase muteUseCase;

  BrainMuteControllerImpl({required this.muteUseCase});

  bool changeValue() {
    bool changed = muteUseCase.changeValue();
    update();

    return changed;
  }

  bool isMuted() => muteUseCase.read();
}
