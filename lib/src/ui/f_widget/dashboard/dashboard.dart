import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';

class DashBoard extends StatelessWidget {
  DashBoard({
    Key? key,
  }) : super(key: key);

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
    Size size = Get.size;
    return Positioned(
      left: 10,
      top: 10,
      child: IconButton(
        onPressed: Get.find<BrainZoomDrawerController>().toggleDrawer,
        icon: FaIcon(
          FontAwesomeIcons.cogs,
          color: Colors.black87,
          size: size.width / 13,
        ),
      ),
    );
  }

  _buildTitle() {
    Size size = Get.size;
    return Positioned(
      top: size.height / 13,
      left: size.width / 4 + 5,
      right: size.width / 4,
      child: BounceInDown(
        child: AutoSizeText(
          'Áthlos',
          style: Get.theme.textTheme.headline1?.copyWith(
            fontSize: size.height / 8,
          ),
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
        left: size.width / 9,
        right: size.width / 9,
        top: size.height / 2.3,
      ),
      child: Positioned(
        top: size.height / 3.3,
        left: size.width / 5,
        right: size.width / 5,
        child: Center(
          child: PushableButton(
            child: Text(
              'Jugar',
              style: Get.theme.textTheme.subtitle2?.copyWith(
                fontSize: size.width / 14,
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
              Get.toNamed(
                DnDLevelsScreen.ROUTE_NAME,
                arguments: {
                  //hacerlo en runtime para que cada vez que entre actualize
                  'mute': Get.find<BrainMuteController>().isMuted(),
                },
              );
              // if (openClose) {
              //   key.currentState!.forwardAnimation();
              //   openClose = false;
              // } else {
              //   key.currentState!.reverseAnimation();
              //   openClose = true;
              // }
            },
          ),
        ),
      ),
    );
  }

  _buildCircularMenuItem({
    required String badgeLabel,
    required Color color,
    required Color badgeColor,
    required IconData icon,
    required VoidCallback onTap,
    required Size size,
  }) {
    return CircularMenuItem(
      margin: size.width / 19,
      iconSize: size.width / 11,
      enableBadge: true,
      badgeColor: badgeColor,
      badgeLabel: badgeLabel,
      badgeRadius: 20,
      badgeTextColor: Colors.white,
      badgeTextStyle: Get.textTheme.subtitle2?.copyWith(
        fontSize: size.width / 22,
      ),
      badgeLeftOffet: size.width / 6,
      badgeTopOffet: 0,
      icon: icon,
      color: color,
      onTap: onTap,
    );
  }
}
