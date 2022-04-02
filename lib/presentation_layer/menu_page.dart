import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/auth_controller.dart';

import 'login_screen.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imgs/app_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          ListTile(
            title: Text(
              'FAQ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: Icon(
              Icons.format_quote,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onTap: () async {
              final authController = Get.find<AuthController>();
              await authController.logoutUser();
            },
          ),
        ],
      ),
    );
  }
}
