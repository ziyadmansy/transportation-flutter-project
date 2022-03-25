import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/auth_controller.dart';

import '../shared/shared_widgets.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget buildOptionItem({
    required String title,
    required IconData icon,
  }) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: SharedWidgets.appBar(title: ''),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16,
            ),
            child: Column(
              children: [
                const Text(
                  'My Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                      ),
                      title: Text('David Wolion'),
                      subtitle: Text('sample@gmail.com'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Preferences',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      buildOptionItem(
                        title: 'Notification',
                        icon: Icons.notifications,
                      ),
                      buildOptionItem(
                        title: 'Language',
                        icon: Icons.chat_bubble,
                      ),
                      buildOptionItem(
                        title: 'Currency',
                        icon: Icons.attach_money,
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Banking & Payment',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      buildOptionItem(
                        title: 'Payment Method',
                        icon: Icons.payment,
                      ),
                      buildOptionItem(
                        title: 'Privacy Policy',
                        icon: Icons.policy,
                      ),
                      buildOptionItem(
                        title: 'Terms of Use',
                        icon: Icons.circle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SharedWidgets.buildElevatedButton(
                  width: Get.width,
                  btnColor: primaryColor,
                  onPress: () async {
                    await Get.find<AuthController>().logoutUser();
                  },
                  btnText: 'Logout',
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
