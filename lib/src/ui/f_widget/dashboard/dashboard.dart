import 'dart:math';

import 'package:circular_menu/circular_menu.dart';
import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
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
              _buildMultiMenu(context),
              //     _buildMainOptions(),
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
      child: StrawberryWidgets.circularButtonWithIcon(
        onPressed: Get.find<BrainZoomDrawerController>().toggleDrawer,
        backgroundColor: Colors.transparent,
        child: StrawberryWidgets.normalIcon(
          icon: Icons.settings,
          iconColor: Colors.black,
        ),
      ),
    );
  }

  _buildHintText() {
    return Positioned(
      right: 0,
      top: 40, //MediaQuery.of(Get.context!).size.height / 18,
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
            RandomTile(),
          ],
        ),
      ),
    );
  }

  _buildMultiMenu(BuildContext context) {
    GlobalKey<CircularMenuState> key = GlobalKey<CircularMenuState>();
    Size size = MediaQuery.of(context).size;
    bool openClose = true;
    return Padding(
      padding: EdgeInsets.only(
        top: size.height / 2.5,
      ),
      child: CircularMenu(
        // Menu alignment.
        alignment: Alignment.center,
        toggleButtonColor: Colors.transparent,
        toggleButtonIconColor: Colors.transparent,
        toggleButtonPadding: 0,
        radius: 150,

        // animation curve in forward
        curve: Curves.bounceOut,
        // animation curve in reverse
        reverseCurve: Curves.fastOutSlowIn,

        startingAngleInRadian: pi * 0.25,
        endingAngleInRadian: pi * 0.75,

        backgroundWidget: Center(
          child: MaterialButton(
            onPressed: () {
              if (openClose) {
                key.currentState!.forwardAnimation();
                openClose = false;
              } else {
                key.currentState!.reverseAnimation();
                openClose = true;
              }
            },
            color: Colors.pink,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.only(
                bottom: 20,
                left: size.width / 4,
                top: 20,
                right: size.width / 4),
            child: Text(
              'Jugar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),

        key: key,

        items: [
          CircularMenuItem(
            margin: 20,
            iconSize: 40,
            enableBadge: true,
            badgeColor: Colors.lightGreenAccent,
            badgeLabel: 'Puzzle',
            badgeRadius: 20,
            badgeTextColor: Colors.white,
            badgeTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            badgeLeftOffet: size.width / 6,
            badgeTopOffet: 0,
            icon: Icons.extension,
            color: Colors.green,
            onTap: () => Get.toNamed(DnDLevelsScreen.ROUTE_NAME),
          ),
          CircularMenuItem(
            margin: 20,
            iconSize: 40,
            enableBadge: true,
            badgeColor: Colors.lightBlueAccent,
            badgeLabel: 'Ahorcado',
            badgeRadius: 20,
            badgeTextColor: Colors.white,
            badgeTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            badgeLeftOffet: size.width / 6,
            badgeTopOffet: 0,
            icon: Icons.sentiment_very_dissatisfied_outlined,
            color: Colors.blue,
            onTap: () => Get.toNamed(HangManLevelsScreen.ROUTE_NAME),
          ),
          CircularMenuItem(
            margin: 20,
            iconSize: 40,
            enableBadge: true,
            badgeColor: Colors.amber,
            badgeLabel: 'Trivia',
            badgeRadius: 20,
            badgeTextColor: Colors.white,
            badgeTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            badgeLeftOffet: size.width / 6,
            badgeTopOffet: 0,
            icon: Icons.format_list_numbered_outlined,
            color: Colors.orange,
            onTap: () => Get.toNamed(TriviaLevelsScreen.ROUTE_NAME),
          ),
        ],
      ),
    );
  }
}
