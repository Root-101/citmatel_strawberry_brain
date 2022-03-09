import 'package:citmatel_strawberry_brain/assets/brain_assets.dart';
import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Credits extends StatelessWidget {
  static final ROUTE_NAME = "/credits";
  final CreditDomain credits = CreditDomain();

  Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double textSize = deviceSize.width / 21;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFEBEE),
                Color(0xFF90CAF9),
              ],
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    _buildAppHeader(deviceSize),
                    SizedBox(
                      height: 20,
                    ),
                    _buildEquipoDeRelizacion(deviceSize),
                    SizedBox(
                      height: 20,
                    ),
                    _buildCredit(credits.clientCredits1, textSize),
                    SizedBox(
                      height: 10,
                    ),
                    //------------------- DEV -------------------
                    _buildCreditHeader(credits.devCredits1.header, textSize),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            credits.devLogo,
                            width: deviceSize.width / 2,
                            height: deviceSize.height / 9,
                          ),
                        ),
                      ],
                    ),
                    ...credits.devCredits1.peoples
                        .map(
                          (people) => _buildCreditDetail(people, textSize),
                        )
                        .toList(),
                    //------------------- /DEV -------------------
                    SizedBox(
                      height: 10,
                    ),
                    _buildCredit(credits.clientCredits2, textSize),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ...credits.others
                        .map(
                          (e) => Text(
                            e,
                            style: Get.textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        )
                        .toList(),
                    Text(
                      credits.ISBN,
                      style: Get.textTheme.subtitle2?.copyWith(
                        color: Colors.black,
                        fontSize: textSize,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ...credits.copyright
                        .map(
                          (e) => Text(
                            e,
                            style: Get.textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                              fontSize: deviceSize.width / 25,
                            ),
                          ),
                        )
                        .toList(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                  ),
                  color: Colors.black,
                  onPressed: () => Get.back(),
                  iconSize: deviceSize.width / 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildEquipoDeRelizacion(Size deviceSize) {
    return Text(
      "Equipo de realización",
      style: Get.textTheme.bodyText1?.copyWith(
        fontSize: deviceSize.width / 18,
        color: Colors.black,
      ),
    );
  }

  _buildCredit(List<CreditInfo> credits, double textSize) {
    return Column(
      children: credits
          .map(
            (credit) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  _buildCreditHeader(credit.header, textSize),
                  SizedBox(
                    height: 5,
                  ),
                  ...credit.peoples
                      .map(
                        (people) => _buildCreditDetail(people, textSize),
                      )
                      .toList(),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  _buildCreditHeader(String header, double textSize) {
    return Text(
      header,
      style: Get.textTheme.subtitle2?.copyWith(
        fontSize: textSize,
        color: Colors.black,
      ),
    );
  }

  _buildCreditDetail(String people, double textSize) {
    return Text(
      people,
      style: Get.textTheme.bodyText1?.copyWith(
        fontSize: textSize,
        color: Colors.black,
      ),
    );
  }

  _buildAppHeader(Size deviceSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              credits.appName,
              style: Get.textTheme.headline1?.copyWith(
                fontSize: deviceSize.width / 10,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              credits.versionNumber,
              style: Get.textTheme.subtitle2?.copyWith(
                color: Colors.black,
                fontSize: deviceSize.width / 24,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}

class CreditDomain {
  String appName = AppInfo.instance.appName; //"BRAIN";
  String versionNumber = AppInfo.instance.version; //"0.1.0.SNAP...";
  String appIconURL = AppInfo.instance.appIconURL; //"assets/app_icon.png";

  final String clientLogo = BrainAssets.APP_CLIENT_LOGO;
  final String devLogo = BrainAssets.APP_DEV_LOGO_FLAT;

  final List<CreditInfo> clientCredits1 = [
    CreditInfo(
      header: "Líder de proyecto",
      peoples: ["Mayling Mirabal Olivera"],
    ),
    CreditInfo(
      header: "Idea original",
      peoples: ["Manuel A. Iturralde Vinent"],
    ),
  ];

  final List<CreditInfo> clientCredits2 = [
    CreditInfo(
      header: "Control de la calidad",
      peoples: ["Hissel Lamanier Regueiferos"],
    ),
    CreditInfo(
      header: "Gestión de la calidad",
      peoples: [
        "Mercedes M. Sosa Hernández",
        "Ivett Muñoz Ramírez",
      ],
    ),
  ];

  final CreditInfo devCredits1 = CreditInfo(
    header: "Diseño y Programación",
    peoples: [
      "Jesús Hernández Barrios",
      "Jessica Aidyl García Albalah",
      "José Luis Hernández Barrios",
      "Brian Alejandro Luis Requeiro",
      "Contáctenos: +53 5 426 8660",
    ],
  );
  final List<String> others = [];

  final String ISBN = "ISBN: 978-959-315-255-6";
  final List<String> copyright = [
    "© Copyright CITMATEL®, 2022",
    "Todos los derechos reservados."
  ];
}

class CreditInfo {
  final String header;
  final List<String> peoples;

  CreditInfo({required this.header, required this.peoples});
}
