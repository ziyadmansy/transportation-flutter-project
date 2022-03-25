import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:transportation_flutter_project/presentation_layer/payment_screen.dart';

import '../shared/shared_widgets.dart';
import '../utils/constants.dart';

class CompaniesScreen extends StatefulWidget {
  static const String routeName = '/companies';
  const CompaniesScreen({Key? key}) : super(key: key);

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  Widget buildCompanyListTile({
    required String title,
    required String imgUrl,
    required VoidCallback onPress,
    required double rate,
  }) {
    return ListTile(
      tileColor: Colors.white54,
      leading: Container(
        width: 50,
        height: 50,
        color: Colors.white,
      ),
      title: Text(title),
      trailing: SimpleStarRating(
        starCount: 5,
        rating: rate,
        size: 18,
        isReadOnly: true,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      onTap: onPress,
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
        body: Column(
          children: [
            const Text(
              'Companies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            buildCompanyListTile(
              title: 'Name of Comapny',
              imgUrl: '',
              rate: 3.0,
              onPress: () {
                Get.toNamed(PaymentScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
