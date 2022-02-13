import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
              _buildTitle(),
              _buildSettingsButton(),
              //  _buildHintText(),
              _buildMultiMenu(),
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

  _buildTitle() {
    Size size = Get.size;
    return Positioned(
      left: size.width / 4.5, //TODO: con 0 no funciona
      right: size.width / 6,
      top: size.height / 13,
      child: BounceInDown(
        child: AutoSizeText(
          'Áthlos',
          style: Get.theme.textTheme.headline1,
          maxLines: 1,
        ),
      ),
    );
  }

  _buildMultiMenu() {
    Size size = Get.size;
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
        radius: size.width / 2.5,

        // animation curve in forward
        curve: Curves.bounceOut,
        // animation curve in reverse
        reverseCurve: Curves.fastOutSlowIn,

        startingAngleInRadian: pi * 0.25,
        endingAngleInRadian: pi * 0.75,

        backgroundWidget: Positioned(
          top: size.height / 4.2,
          left: size.width / 5,
          right: size.width / 5,
          child: Center(
            child: PushableButton(
              child: Text(
                'Jugar',
                style: Get.theme.textTheme.subtitle2,
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
          _buildCircularMenuItem(
            badgeLabel: DnDUIModule.MODULE_NAME,
            color: DnDUIModule.PRIMARY_COLOR,
            badgeColor: DnDUIModule.SECONDARY_COLOR,
            icon: DnDUIModule.ICON,
            onTap: () => Get.toNamed(DnDLevelsScreen.ROUTE_NAME),
          ),
          _buildCircularMenuItem(
            badgeLabel: TriviaUIModule.MODULE_NAME,
            color: TriviaUIModule.PRIMARY_COLOR,
            badgeColor: TriviaUIModule.SECONDARY_COLOR,
            icon: TriviaUIModule.ICON,
            onTap: () => Get.toNamed(TriviaLevelsScreen.ROUTE_NAME),
          ),
          _buildCircularMenuItem(
            badgeLabel: HangManUIModule.MODULE_NAME,
            color: HangManUIModule.PRIMARY_COLOR,
            badgeColor: HangManUIModule.SECONDARY_COLOR,
            icon: HangManUIModule.ICON,
            onTap: () => Get.toNamed(HangManLevelsScreen.ROUTE_NAME),
          ),
        ],
      ),
    );
  }

  _buildCircularMenuItem({
    required String badgeLabel,
    required Color color,
    required Color badgeColor,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return CircularMenuItem(
      margin: 20,
      iconSize: 40,
      enableBadge: true,
      badgeColor: badgeColor,
      badgeLabel: badgeLabel,
      badgeRadius: 20,
      badgeTextColor: Colors.white,
      badgeTextStyle: Get.textTheme.subtitle2?.copyWith(
        fontSize: 17,
      ),
      badgeLeftOffet: Get.size.width / 6,
      badgeTopOffet: 0,
      icon: icon,
      color: color,
      onTap: onTap,
    );
  }
}
