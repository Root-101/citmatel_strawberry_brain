import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:citmatel_strawberry_dnd/dnd_exporter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class BrainDrawer extends StatelessWidget {
  BrainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconsSize = size.width / 13;
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
              GetBuilder<BrainMuteController>(
                builder: (controller) {
                  return _buildListTile(
                    size: size,
                    rayado: controller.isMuted(),
                    title: "Sonido.",
                    leading: Icon(
                      controller.isMuted()
                          ? Icons.volume_off_rounded
                          : Icons.volume_up_rounded,
                      size: iconsSize,
                      color: Colors.blue.shade900,
                    ),
                    tapHandler: () {
                      controller.changeValue();
                    },
                  );
                },
              ),
              GetBuilder<BrainVibrationController>(
                builder: (controller) {
                  return _buildListTile(
                    size: size,
                    rayado: !controller.isVibration(),
                    title: "Vibraciones.",
                    leading: Icon(
                      controller.isVibration() ? Icons.check : Icons.close,
                      size: iconsSize,
                      color: Colors.blue.shade900,
                    ),
                    tapHandler: () {
                      controller.changeValue();
                    },
                  );
                },
              ),
              GetBuilder<DnDShowPopupController>(
                builder: (controller) {
                  return _buildListTile(
                    size: size,
                    rayado: !controller.isShowing(),
                    title: "Notificaciones.",
                    leading: controller.isShowing()
                        ? FaIcon(
                            FontAwesomeIcons.solidComment,
                            size: iconsSize,
                            color: Colors.blue.shade900,
                          )
                        : FaIcon(
                            FontAwesomeIcons.commentSlash,
                            size: iconsSize,
                            color: Colors.blue.shade900,
                          ),
                    tapHandler: () {
                      Get.find<DnDShowPopupController>().changeValue();
                    },
                  );
                },
              ),
              _buildListTile(
                size: size,
                title: "Twitter.",
                leading: Icon(
                  FontAwesomeIcons.twitter,
                  size: iconsSize,
                  color: Color.fromRGBO(29, 161, 242, 1),
                ),
                tapHandler: () =>
                    _openURL("https://www.twitter.com/@libreriavcuba"),
              ),
              _buildListTile(
                size: size,
                title: "Facebook.",
                leading: Icon(
                  FontAwesomeIcons.facebookF,
                  size: iconsSize,
                  color: Color.fromRGBO(66, 103, 178, 1),
                ),
                tapHandler: () =>
                    _openURL("https://www.facebook.com/LibreriaVirtual"),
              ),
              _buildListTile(
                size: size,
                title: "Librería Virtual.",
                leading: Image.asset(
                  BrainAssets.APP_LIBRERIA,
                  width: size.width / 11,
                  height: size.width / 11,
                ),
                tapHandler: () =>
                    _openURL("https://www.superfacil.cu/libreria"),
              ),
              _buildListTile(
                size: size,
                title: "Sobre nosotros...",
                leading: Icon(
                  FontAwesomeIcons.infoCircle,
                  size: iconsSize,
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
    required Size size,
    bool rayado = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height / 75,
        horizontal: 2.0,
      ),
      child: ListTile(
        leading: leading,
        minLeadingWidth: size.width / 25,
        title: Text(
          title,
          style: Get.textTheme.subtitle2?.copyWith(
            decoration:
                rayado ? TextDecoration.lineThrough : TextDecoration.none,
            fontSize: size.width / 20,
            shadows: [
              Shadow(
                color: Colors.blue.shade900,
                blurRadius: 10.0,
                offset: Offset(3.0, 3.0),
              ),
              Shadow(
                color: Colors.black,
                blurRadius: 10.0,
                offset: Offset(-3.0, 3.0),
              ),
            ],
          ),
        ),
        onTap: () => tapHandler(),
      ),
    );
  }
}
