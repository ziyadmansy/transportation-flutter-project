import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transportation_flutter_project/enums/transportation_type.dart';
import 'package:transportation_flutter_project/presentation_layer/transportation_form_screen.dart';
import 'package:transportation_flutter_project/shared/shared_widgets.dart';
import 'package:transportation_flutter_project/utils/constants.dart';

import '../buisness_logic_layer/home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();

  Widget buildTransportationCard({
    required String title,
    required String imgPath,
    required VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: onPressed,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              children: [
                Image.asset(
                  imgPath,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTransportationCard(
              title: 'Sea Freight',
              imgPath: 'assets/imgs/sea_logo.png',
              onPressed: () {
                Get.toNamed(
                  TransportationFormScreen.routeName,
                  arguments: TransportationType.sea,
                );
              },
            ),
            buildTransportationCard(
              title: 'Land Shipping',
              imgPath: 'assets/imgs/land_logo.png',
              onPressed: () {
                Get.toNamed(
                  TransportationFormScreen.routeName,
                  arguments: TransportationType.land,
                );
              },
            ),
            buildTransportationCard(
              title: 'Customs',
              imgPath: 'assets/imgs/customs_logo.png',
              onPressed: () {
                Get.toNamed(
                  TransportationFormScreen.routeName,
                  arguments: TransportationType.custom,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
