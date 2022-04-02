import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('FAQ'),
          leading: Icon(Icons.format_quote),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.logout),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            Get.offAllNamed(LoginScreen.routeName);
          },
        ),
      ],
    );
  }
}
