import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_trivia/trivia_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(SplashScreen());
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    BrainUIModule.init();
    await AppInfo.instance.initialize();
    //await Future.delayed(const Duration(seconds: 10));
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //aqui y no en el main por un posible bug en flutter, info at https://stackoverflow.com/questions/49418332/flutter-how-to-prevent-device-orientation-changes-and-force-portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return SecondarySplashScreen(
      future: Init.instance.initialize(),
      mainApp: BrainMaterialApp(),
      splashes: [
        SingleSplashModel(
          splash: Container(
            color: Colors.blueAccent,
            child: SplashScreenClient1(),
          ),
          duration: 13,
        ),
        SingleSplashModel(
          splash: Container(
            decoration: BoxDecoration(
              color: Colors.transparent, //pa si por si acaso
              image: DecorationImage(
                image: AssetImage(BrainAssets.CHARACTER_BACKGROUND_MAIN),
                fit: BoxFit.cover,
              ),
            ),
          ),
          duration: 5,
        ),
      ],
    );
  }
}

class BrainMaterialApp extends StatelessWidget {
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
        GetPage(
          name: Credits.ROUTE_NAME,
          page: () => Credits(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: DnDLevelsScreen.ROUTE_NAME,
          page: () => DnDLevelsScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: HangManLevelsScreen.ROUTE_NAME,
          page: () => HangManLevelsScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: TriviaLevelsScreen.ROUTE_NAME,
          page: () => TriviaLevelsScreen(),
          transition: Transition.downToUp,
        ),
      ],
      unknownRoute: GetPage(
          name: UnknownRouteScreen.ROUTE_NAME,
          page: () => UnknownRouteScreen()),
      //--------------------- </PAGINATION> -----------------------------------
    );
  }
}
