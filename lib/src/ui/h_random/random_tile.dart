import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class RandomTile extends StatelessWidget {
  late Widget _random;

  RandomTile({Key? key}) : super(key: key) {
    _random = _randomSubLevelWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OpenContainer(
        onClosed: (_) {
          _random = _randomSubLevelWidget();
        },
        closedBuilder: (_, __) {
          return Container(
            color: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.approval,
                  color: Colors.black,
                ),
                Text(
                  "Aleatorio",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        openBuilder: (_, __) {
          return _random;
        },
      ),
    );
  }

  _randomSubLevelWidget() {
    return Center(
        child: Text(
            "Modo de juego desabilitado por el momento por trabajo con el progreso en la BD."));

    /*BrainRandomController controller = Get.find();

    GameMode mode = controller.randomGameMode();
    switch (mode) {
      case GameMode.TRIVIA:
        return TriviaSubLevelBackground(
          subLevelDomain: controller.randomTriviaSublevel(),
        );
      case GameMode.HANGMAN:
        return HangManSubLevelLoading(
          subLevelDomain: controller.randomHangmanSublevel(),
        );
      case GameMode.DND:
        return DnDSubLevelLoading(
          subLevelDomain: controller.randomDnDSublevel(),
        );
    }*/
  }
}
