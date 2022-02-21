import 'package:citmatel_strawberry_brain/brain_exporter.dart';
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
                title: "Librería Virtual.",
                leading: Image.asset(
                  BrainAssets.APP_LIBRERIA,
                  width: 30,
                  height: 30,
                ),
                tapHandler: () =>
                    _openURL("https://www.superfacil.cu/libreria"),
              ),
              _buildListTile(
                title: "Contáctanos por Twitter.",
                leading: Icon(
                  FontAwesomeIcons.twitter,
                  size: 30,
                  color: Color.fromRGBO(29, 161, 242, 1),
                ),
                tapHandler: () =>
                    _openURL("https://www.twitter.com/@libreriavcuba"),
              ),
              _buildListTile(
                title: "Contáctanos por Facebook.",
                leading: Icon(
                  FontAwesomeIcons.facebookF,
                  size: 30,
                  color: Color.fromRGBO(66, 103, 178, 1),
                ),
                tapHandler: () =>
                    _openURL("https://www.facebook.com/LibreriaVirtual"),
              ),
              _buildListTile(
                title: "Sobre nosotros...",
                leading: Icon(
                  FontAwesomeIcons.infoCircle,
                  size: 30,
                ),
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

  _openURL(String url) async {
    if (!await launch(url)) {
      Get.snackbar("Error lanzando URL",
          "Error tratando de abrir la URL $url, es probable que el dispositivo no soporte la opción de abrir URls externas.");
    }
  }

  _buildListTile({
    required String title,
    required Widget leading,
    required Function tapHandler,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: leading,
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
