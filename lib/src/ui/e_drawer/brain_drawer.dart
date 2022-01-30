import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BrainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, //pa si por si acaso
          image: DecorationImage(
            image: AssetImage(BrainAssets.CHARACTER_BACKGROUND_DASHBOARD),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildListTile(
                "Google",
                Icons.animation,
                () async {
                  String url = "https://google.com";
                  if (!await launch(url))
                    Get.snackbar("Error lanzando URL",
                        "Error tratando de abrir la URL $url, es probable que el dispositivo no soporte la opción de abrir URls externas.");
                },
              ),
              _buildListTile(
                "Que se yo que mas va aquí",
                Icons.ac_unit_outlined,
                () {
                  Get.snackbar("Ni idea",
                      "De verdad no tengo idea de que puede ir aquí.");
                },
              ),
              _buildListTile(
                "Sobre nosotros...",
                Icons.info_outline_rounded,
                () {
                  Get.toNamed(Credits.ROUTE_NAME);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildListTile(String title, IconData icon, Function tapHandler) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        minLeadingWidth: 15,
        title: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        onTap: () => tapHandler(),
      ),
    );
  }
}
