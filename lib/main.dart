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
          duration: 9,
        ),
        /*SingleSplashModel(
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
        ),*/
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
      theme: _buildTheme(),
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

  ThemeData _buildTheme() {
    const String FONT_FAMILY_CHOCOLATE = "Chocolate";

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Define the default brightness and colors.
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.purple,
        secondary: Colors.deepOrange,
      ),

      // Define the default font family.
      //fontFamily: 'Georgia',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        //utilizado para el texto de los diferentes temas
        headline6: const TextStyle(
          fontFamily: FONT_FAMILY_CHOCOLATE,
          fontWeight: FontWeight.bold,
          fontSize: 40,
          /*shadows: [
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
          ],*/
        ),
        //utilizado para el header del tutorial
        subtitle1: TextStyle(
          fontSize: 50.0,
          fontFamily: FONT_FAMILY_CHOCOLATE,
          fontWeight: FontWeight.bold,
        ),
        //utilizado para los tiles
        subtitle2: TextStyle(
          fontSize: 35.0,
          fontFamily: FONT_FAMILY_CHOCOLATE,
          fontWeight: FontWeight.bold,
        ),
        //para el texto del tutorial
        bodyText1: TextStyle(
          fontSize: 35.0,
          fontFamily: FONT_FAMILY_CHOCOLATE,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}
