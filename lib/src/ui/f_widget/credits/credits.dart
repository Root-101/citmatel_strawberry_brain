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
    return Scaffold(
      backgroundColor: Colors.white,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                _buildAppHeader(),
                SizedBox(
                  height: 20,
                ),
                _buildEquipoDeRelizacion(),
                SizedBox(
                  height: 20,
                ),
                _buildCredit(credits.clientCredits1),
                SizedBox(
                  height: 10,
                ),
                //------------------- DEV -------------------
                _buildCreditHeader(credits.devCredits1.header),
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
                        width: 150,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                ...credits.devCredits1.peoples
                    .map((people) => _buildCreditDetail(people))
                    .toList(),
                //------------------- /DEV -------------------
                SizedBox(
                  height: 10,
                ),
                _buildCredit(credits.clientCredits2),
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
                    fontSize: 20,
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
        ),
      ),
    );
  }

  _buildEquipoDeRelizacion() {
    return Text(
      "Equipo de realización",
      style: Get.textTheme.bodyText1?.copyWith(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }

  _buildCredit(List<CreditInfo> credits) {
    return Column(
      children: credits
          .map(
            (credit) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  _buildCreditHeader(credit.header),
                  SizedBox(
                    height: 5,
                  ),
                  ...credit.peoples
                      .map((people) => _buildCreditDetail(people))
                      .toList(),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  _buildCreditHeader(String header) {
    return Text(
      header,
      style: Get.textTheme.bodyText1?.copyWith(
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }

  _buildCreditDetail(String people) {
    return Text(
      people,
      style: Get.textTheme.subtitle2?.copyWith(
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }

  _buildAppHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*Image.asset(
          credits.appIconURL,
          width: 80,
          height: 80,
        ),*/
        Column(
          children: [
            Text(
              credits.appName,
              style: Get.textTheme.headline1?.copyWith(
                fontSize: 55,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              credits.versionNumber,
              style: Get.textTheme.subtitle2?.copyWith(
                color: Colors.black,
                fontSize: 18,
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
      "Ing. Jessica Aidyl García Albalah",
      "Lic. José Luis Hernández Barrios",
      "Brian Alejandro Luis Requeiro",
      "Contáctenos: +53 5 426 8660",
    ],
  );
  final List<String> others = [];

  final String ISBN = "ISBN: 978-959-315-XXX-X";
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
