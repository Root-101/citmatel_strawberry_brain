import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //aqui y no en el main por un posible bug en flutter, info at https://stackoverflow.com/questions/49418332/flutter-how-to-prevent-device-orientation-changes-and-force-portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              home: SecondarySplash()); //SecondarySplash mientras carga
        } else {
          return MainApp(); //app como tal una vez que carga
        }
      },
    );
  }
}

class MainApp extends StatelessWidget {
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
      ],
      unknownRoute: GetPage(
          name: UnknownRouteScreen.ROUTE_NAME,
          page: () => UnknownRouteScreen()),
      //--------------------- </PAGINATION> -----------------------------------
    );
  }
}

class SecondarySplash extends StatelessWidget {
  const SecondarySplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe1f5fe),
      body: Center(
        child: Text("Secondary Splash"), //Image.asset('assets/splash.png'),
      ),
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    BrainUIModule.init();
    await AppInfo.instance.initialize();
    //await Future.delayed(const Duration(seconds: 3));
  }
}
