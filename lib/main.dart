import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  BrainUIModule.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Playing App',
      debugShowCheckedModeBanner: false,
      //--------------------- <THEAMING> -----------------------------------
      darkTheme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //--------------------- </THEAMING> -----------------------------------
      //--------------------- <PAGINATION> -----------------------------------
      initialRoute: HomePage.ROUTE_NAME,
      getPages: [
        GetPage(
          name: HomePage.ROUTE_NAME,
          page: () => HomePage(),
          transition: Transition.rightToLeft,
        ),
      ],
      unknownRoute: GetPage(
          name: UnknownRouteScreen.ROUTE_NAME,
          page: () => UnknownRouteScreen()),
      //--------------------- </PAGINATION> -----------------------------------
    );
  }
}
