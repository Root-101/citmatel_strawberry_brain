import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';

class DashBoard extends StatelessWidget {
  static final ROUTE_NAME = "/";

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: BrainDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            _buildSettingsButton(),
            _buildDashboard(context),
          ],
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
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
    );
  }

  _buildDashboard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 50), //espacio entre appbar y resto
        HintTextWidget(),
        _buildMainOptions(context),
      ],
    );
  }

  _buildMainOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      //childAspectRatio es 4/3, por lo tanto va a ser mas ancho que alto,
      //por lo tanto su alto va a ser su ancho mas chiquito, exactamente 3/4
      // mas chiquito + 10px pa si x si acaso
      // height = width * childAspectRatio^-1 + 10
      // childAspectRatio^-1 = inverso de childAspectRatio
      height: MediaQuery.of(context).size.width * 3 / 4 + 10,
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
          Card(
            child: Text("HangMan"),
          ),
          Card(
            child: Text("DnD"),
          ),
          Card(
            child: Text("Random"),
          ),
        ],
      ),
    );
  }
}
