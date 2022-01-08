import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:get/get.dart';

abstract class BrainRandomController extends GetxController {
  GameMode randomGameMode();

  TriviaSubLevelDomain randomTriviaSublevel();

  HangManSubLevelDomain randomHangmanSublevel();

  DnDSubLevelDomain randomDnDSublevel();
}

enum GameMode {
  TRIVIA,
  HANGMAN,
  DND,
}
