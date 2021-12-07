import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Playing!!!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile('Ligth', Icons.light_mode_outlined, () {
            Get.changeTheme(ThemeData.light());
          }),
          _buildListTile('Dark', Icons.dark_mode_outlined, () {
            Get.changeTheme(ThemeData.dark());
          }),
          _buildListTile(
            'About',
            Icons.local_police,
            () {
              showAboutDialog(
                context: context,
                applicationVersion: 'version number',
                applicationIcon: Icon(Icons.ac_unit),
                applicationLegalese: "Hellouuuuuu",
                children: [
                  Text('hi 1'),
                  Text('hi 2'),
                  Text('hi 3'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  _buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }
}
