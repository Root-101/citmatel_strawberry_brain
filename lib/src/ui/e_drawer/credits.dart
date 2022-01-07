import 'package:citmatel_strawberry_brain/assets/brain_assets.dart';
import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  static final ROUTE_NAME = "/credits";
  final CreditDomain credits = CreditDomain();

  Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(credits.ISBN),
              SizedBox(
                height: 30,
              ),
              ...credits.copyright.map((e) => Text(e)).toList(),
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
        Image.asset(logoURL),
        SizedBox(
          height: 10,
        ),
        Text("EQUIPO DE REALIZACIÓN"),
        SizedBox(
          height: 5,
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
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  _buildCreditDetail(String people) {
    return Text(
      people,
      style: TextStyle(fontWeight: FontWeight.normal),
    );
  }

  _buildAppHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(credits.appIconURL),
        Column(
          children: [
            Text(
              credits.appName,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Text(
              credits.versionNumber,
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
      header: "Otros colaboradores",
      peoples: ["Ing. Jessica Aidyl García Albalah"],
    ),
  ];
  final String ISBN = "ISBN:123-456-789-000";
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
