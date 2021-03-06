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
    await BrainUIModule.init();
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
            child: SplashScreenClient1(
              mute:
                  false, //Get.find<BrainMuteController>().isMuted(),//no se puede, el video se ponde antes que la app carge. mirar para ultima version de splash para resolverlo
            ),
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
      title: '??thlos',
      debugShowCheckedModeBanner: true,
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
          page: () => DnDLevelsScreen(
            mute: Get.arguments['mute'],
          ),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: HangManLevelsScreen.ROUTE_NAME,
          page: () => HangManLevelsScreen(
            mute: Get.arguments['mute'],
          ),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: TriviaLevelsScreen.ROUTE_NAME,
          page: () => TriviaLevelsScreen(
            mute: Get.arguments['mute'],
          ),
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
    const String FONT_FAMILY_LOBSTER = "Lobster";
    const String FONT_FAMILY_AKAYA = "AkayaTelivigala";
    const String FONT_FAMILY_SLAB = "RobotoSlab";

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Define the default brightness and colors.
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Color(0xff00a4db),
        secondary: Color(0xff002edb),
      ),

      // Define the default font family.
      fontFamily: FONT_FAMILY_SLAB,

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        //utilizado para el texto principal del juego
        headline1: TextStyle(
          fontFamily: FONT_FAMILY_LOBSTER,
          fontSize: 90,
          color: Color(0xff2a3762),
          shadows: [
            Shadow(
              color: Colors.blue,
              blurRadius: 10.0,
              offset: Offset(3.0, 3.0),
            ),
            Shadow(
              color: Colors.red,
              blurRadius: 10.0,
              offset: Offset(-3.0, 3.0),
            ),
          ],
        ),
        //utilizado para:
        // - el cargando
        // - los carteles de win/loose
        headline4: const TextStyle(
          fontFamily: FONT_FAMILY_AKAYA,
          fontWeight: FontWeight.bold,
          fontSize: 70,
        ),
        //utilizado para:
        // - el nombre de los modulos
        headline5: const TextStyle(
          fontFamily: FONT_FAMILY_AKAYA,
          fontWeight: FontWeight.bold,
          fontSize: 33,
        ),
        //utilizado para :
        // - el tile de la seleccion
        headline6: const TextStyle(
          fontFamily: FONT_FAMILY_AKAYA,
          fontWeight: FontWeight.normal,
          fontSize: 30,
        ),
        //utilizado para:
        // - el header del tutorial
        // - la letra inicial en el trivia
        subtitle1: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
        //utilizado para:
        // - los header de los subniveles
        // - Los badges de los modulos en los botones iniciales
        // - los card con las letras en el ahorcado
        // - La pregunta en el trivia
        // - las respuestas en el trivia
        // - el texto en el appbar de cada modulo(sale todo por tools)
        // - el contador de estrellas de cada nivel(5 / 10 *)
        subtitle2: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        //utilizado para:
        // - el texto del tutorial
        // - los segundos restantes en el contador de trivia
        bodyText1: TextStyle(
          fontSize: 20.0,
        ),
        //utilizado para:
        // - el texto de los subniveles
        bodyText2: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
