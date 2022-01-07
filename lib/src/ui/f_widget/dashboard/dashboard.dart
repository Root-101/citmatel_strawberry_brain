import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, //pa si por si acaso
          image: DecorationImage(
            image: AssetImage(BrainAssets.CHARACTER_BACKGROUND_MAIN),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              _buildSettingsButton(),
              _buildHintText(),
              _buildMainOptions(),
            ],
          ),
        ),
      ),
    );
  }

  _buildSettingsButton() {
    return Positioned(
      left: 10,
      top: 10,
      child: IconButton(
        icon: Icon(Icons.settings),
        onPressed: Get.find<BrainZoomDrawerController>().toggleDrawer,
      ),
    );
  }

  _buildHintText() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0, //MediaQuery.of(Get.context!).size.height / 18,
      child: HintTextWidget(),
    );
  }

  _buildMainOptions() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        //childAspectRatio es 4/3, por lo tanto va a ser mas ancho que alto,
        //por lo tanto su alto va a ser su ancho mas chiquito, exactamente 3/4
        // mas chiquito + 10px pa si x si acaso
        // height = width * childAspectRatio^-1 + 10
        // childAspectRatio^-1 = inverso de childAspectRatio
        height: MediaQuery.of(Get.context!).size.width * 3 / 4 + 10,
        width: double.infinity,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          physics: NeverScrollableScrollPhysics(),
          children: [
            MainMenuItem(
              color: Colors.orange,
              icon: Icons.category,
              name: "Trivia",
              currentLevel: 1,
              moduleMainScreen: TriviaLevelsScreen(),
            ),
            MainMenuItem(
              color: Colors.blueAccent,
              icon: Icons.ac_unit_outlined,
              name: "Ahorcadito",
              currentLevel: 1,
              moduleMainScreen: HangManLevelsScreen(),
            ),
            MainMenuItem(
              color: Colors.green,
              icon: Icons.inbox,
              name: "DnD",
              currentLevel: 1,
              moduleMainScreen: DnDLevelsScreen(),
            ),
            Card(
              child: Text("Random"),
            ),
          ],
        ),
      ),
    );
  }
}
