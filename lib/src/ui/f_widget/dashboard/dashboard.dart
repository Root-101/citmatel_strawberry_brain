import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              _buildTitle(context, size),
              _buildSettingsButton(),
              //  _buildHintText(),
              _buildMultiMenu(context, size),
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

  _buildTitle(BuildContext context, Size size) {
    return Positioned(
      top: size.height / 13,
      left: size.width / 6,
      right: size.width / 6,
      child: AutoSizeText(
        'Áethlos',
        style: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 90,
          shadows: [
            Shadow(
              color: Colors.blue,
              blurRadius: 10.0,
              offset: Offset(5.0, 5.0),
            ),
            Shadow(
              color: Colors.red,
              blurRadius: 10.0,
              offset: Offset(-5.0, 5.0),
            ),
          ],
        ),
        maxLines: 1,
      ),
    );
  }

  _buildMultiMenu(BuildContext context, Size size) {
    GlobalKey<CircularMenuState> key = GlobalKey<CircularMenuState>();

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

        backgroundWidget: Positioned(
          bottom: 20,
          left: size.width / 5,
          top: 20,
          right: size.width / 5,
          child: Center(
            child: PushableButton(
              child: Text(
                'Jugar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              height: size.height / 13,
              elevation: 8,
              hslColor: HSLColor.fromAHSL(1.0, 195, 1.0, 0.43),
              shadow: BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
              onPressed: () {
                if (openClose) {
                  key.currentState!.forwardAnimation();
                  openClose = false;
                } else {
                  key.currentState!.reverseAnimation();
                  openClose = true;
                }
              },
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
              fontSize: 17,
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
            badgeColor: Colors.amber,
            badgeLabel: 'Trivia',
            badgeRadius: 20,
            badgeTextColor: Colors.white,
            badgeTextStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            badgeLeftOffet: size.width / 6,
            badgeTopOffet: 0,
            icon: Icons.format_list_numbered_outlined,
            color: Colors.orange,
            onTap: () => Get.toNamed(TriviaLevelsScreen.ROUTE_NAME),
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
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            badgeLeftOffet: size.width / 6,
            badgeTopOffet: 0,
            icon: Icons.sentiment_very_dissatisfied_outlined,
            color: Colors.blue,
            onTap: () => Get.toNamed(HangManLevelsScreen.ROUTE_NAME),
          ),
        ],
      ),
    );
  }
}
