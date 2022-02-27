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
              _buildCredit(credits.clientLogo, credits.clientCredits),
              SizedBox(
                height: 30,
              ),
              _buildCredit(credits.devLogo, credits.devCredits),
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
              SizedBox(
                height: 30,
              ),
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
    );
  }

  _buildCredit(String logoURL, List<CreditInfo> credits) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
          child: Image.asset(logoURL),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Equipo de realización",
          style: Get.textTheme.bodyText1?.copyWith(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ...credits
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
            .toList()
      ],
    );
  }

  _buildCreditHeader(String header) {
    return Text(
      header,
      style: Get.textTheme.bodyText1?.copyWith(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }

  _buildCreditDetail(String people) {
    return Text(
      people,
      style: Get.textTheme.subtitle2?.copyWith(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }

  _buildAppHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          credits.appIconURL,
          width: 80,
          height: 80,
        ),
        Column(
          children: [
            Text(
              credits.appName,
              style: Get.textTheme.headline1?.copyWith(
                fontSize: 40,
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
  final List<CreditInfo> clientCredits = [
    CreditInfo(
      header: "Líder de proyecto",
      peoples: ["Mayling Mirabal Olivera"],
    ),
    CreditInfo(
      header: "Idea original",
      peoples: [],
    ),
    CreditInfo(
      header: "Ilustraciones",
      peoples: [],
    ),
    CreditInfo(
      header: "Animación",
      peoples: [],
    ),
    CreditInfo(
      header: "Diseño",
      peoples: [],
    ),
    CreditInfo(
      header: "Sonido",
      peoples: [],
    ),
    CreditInfo(
      header: "Control de la calidad",
      peoples: [],
    ),
    CreditInfo(
      header: "Gestión de la calidad",
      peoples: [
        "Mercedes M. Sosa Hernández",
        "Anays Gómez García",
        "Ivett Muñoz Ramírez",
      ],
    ),
  ];

  final String devLogo = BrainAssets.APP_DEV_LOGO_FLAT;
  final List<CreditInfo> devCredits = [
    CreditInfo(
      header: "Líder de proyecto",
      peoples: ["Jesús Hernández Barrios"],
    ),
    CreditInfo(
      header: "Equipo de desarrollo",
      peoples: [
        "Ing. Jessica Aidyl García Albalah",
        "Lic. José Luis Hernández Barrios",
        "Brian Alejandro Luis Requeiro",
      ],
    ),
  ];

  final List<String> others = [];

  final String ISBN = "ISBN: 123-456-789-000";
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
