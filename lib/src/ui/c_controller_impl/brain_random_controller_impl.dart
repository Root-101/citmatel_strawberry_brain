import 'dart:math';

import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:get/get.dart';

class BrainRandomControllerImpl extends BrainRandomController {
  var _random = Random();

  GameMode randomGameMode() {
    return GameMode.values[_random.nextInt(GameMode.values.length)];
  }

  TriviaSubLevelDomain randomTriviaSublevel() {
    TriviaLevelUseCase UC = Get.find<TriviaLevelUseCase>();
    var level = UC.findAll()[_random.nextInt(UC.count())];
    var sublevel = level.sublevel[_random.nextInt(level.sublevel.length)];
    return sublevel;
  }

  HangManSubLevelDomain randomHangmanSublevel() {
    HangManLevelUseCase UC = Get.find<HangManLevelUseCase>();
    var level = UC.findAll()[_random.nextInt(UC.count())];
    var sublevel = level.sublevel[_random.nextInt(level.sublevel.length)];
    return sublevel;
  }

  DnDSubLevelDomain randomDnDSublevel() {
    DnDLevelUseCase UC = Get.find<DnDLevelUseCase>();
    var level = UC.findAll()[_random.nextInt(UC.count())];
    var sublevel = level.sublevel[_random.nextInt(level.sublevel.length)];
    return sublevel;
  }
}
