import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_brain/src/ui/brain_ui_exporter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                title: "Contáctanos por Twitter.",
                icon: FontAwesomeIcons.twitter,
                iconColor: Color.fromRGBO(29, 161, 242, 1),
                tapHandler: () async {
                  String url = "https://twitter.com/";
                  if (!await launch(url))
                    Get.snackbar("Error lanzando URL",
                        "Error tratando de abrir la URL $url, es probable que el dispositivo no soporte la opción de abrir URls externas.");
                },
              ),
              _buildListTile(
                title: "Contáctanos por Facebook.",
                icon: FontAwesomeIcons.facebookF,
                iconColor: Color.fromRGBO(66, 103, 178, 1),
                tapHandler: () async {
                  String url = "https://www.facebook.com/";
                  if (!await launch(url))
                    Get.snackbar("Error lanzando URL",
                        "Error tratando de abrir la URL $url, es probable que el dispositivo no soporte la opción de abrir URls externas.");
                },
              ),
              _buildListTile(
                title: "Sobre nosotros...",
                icon: FontAwesomeIcons.infoCircle,
                tapHandler: () {
                  Get.toNamed(Credits.ROUTE_NAME);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildListTile({
    required String title,
    required IconData icon,
    required Function tapHandler,
    Color iconColor = Colors.white,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: iconColor,
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
