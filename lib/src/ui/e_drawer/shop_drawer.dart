import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

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
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Ligth', Icons.light_mode_outlined, () {
            Get.changeTheme(ThemeData.light());
          }),
          buildListTile('Dark', Icons.dark_mode_outlined, () {
            Get.changeTheme(ThemeData.dark());
          }),
          buildListTile('123', Icons.settings, () {
            //Navigator.of(context).pushReplacementNamed(FilterScreen.ROUTE_NAME);
          }),
          buildListTile('About', Icons.local_police, () {
            showAboutDialog(
                context: context,
                applicationVersion: 'version number',
                applicationIcon: Icon(Icons.ac_unit),
                applicationLegalese: "Hellouuuuuu",
                children: [
                  Text('hi 1'),
                  Text('hi 2'),
                  Text('hi 3'),
                ]);
          }),
        ],
      ),
    );
  }
}
