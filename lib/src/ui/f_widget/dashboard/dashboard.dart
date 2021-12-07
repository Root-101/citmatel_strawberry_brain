import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:flutter/material.dart';

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
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HintTextWidget(),
                  _buildMainOptions(),
                ],
              ),
            ),
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

  _buildMainOptions() {
    return Center();
  }
}
