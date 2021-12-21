import 'package:flutter/material.dart';
import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';

class Credits extends StatelessWidget {
  static final ROUTE_NAME = "/credits";

  Credits({Key? key}) : super(key: key);

  final String clientIcon = "assets/app_splash_initial.png";
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

  final String devIcon = "assets/app_splash_initial.png";
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
  final List<String> Copyright = [
    "© Copyright CITMATEL®, 2022",
    "Todos los derechos reservados."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(APP_ICON_URL),
                  Text(APP_NAME),
                ],
              ),
              _buildVersionNumber(),
              SizedBox(
                height: 30,
              ),
              _buildCredit(Image.asset(clientIcon), clientCredits),
              SizedBox(
                height: 30,
              ),
              _buildCredit(Image.asset(devIcon), devCredits),
              SizedBox(
                height: 50,
              ),
              Text(ISBN),
              SizedBox(
                height: 30,
              ),
              ...Copyright.map((e) => Text(e)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  _buildVersionNumber() {
    return Column(
      children: [
        Text("Version:"),
        Text(VERSION_NUMBER),
      ],
    );
  }

  _buildCredit(Widget icon, List<CreditInfo> credits) {
    return Column(
      children: [
        icon,
        Text("EQUIPO DE REALIZACIÓN"),
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
}

class CreditInfo {
  final String header;
  final List<String> peoples;

  CreditInfo({required this.header, required this.peoples});
}
