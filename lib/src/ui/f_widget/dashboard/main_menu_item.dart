import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class MainMenuItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String name;
  final int currentLevel;
  final Widget moduleMainScreen;

  const MainMenuItem({
    required this.color,
    required this.icon,
    required this.name,
    required this.currentLevel,
    required this.moduleMainScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OpenContainer(
        transitionDuration: Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => _buildClosed(),
        openBuilder: (context, action) => _buildOpen(),
      ),
    );
  }

  //Tile chiquito que se muestra en la lista con todos los subniveles
  _buildClosed() {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Level $currentLevel",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  //Screen grande para cuando se entra al subnivel, pantalla de juego del subnivel especifico.
  _buildOpen() {
    return moduleMainScreen;
  }
/*

  _closedBuilder() {
    return Container(
      child: Center(child: Text("Chiquito")),
    );
    Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Level $currentLevel",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _openBuilder() {
    return Container(
      child: Center(child: Text("grande")), //moduleMainScreen,
    );
  }*/
}
