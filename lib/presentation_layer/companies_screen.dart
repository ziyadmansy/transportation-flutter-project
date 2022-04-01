import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/orders_controller.dart';
import 'package:transportation_flutter_project/presentation_layer/new_order_screen.dart';
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
    required String subTitle,
    required String imgUrl,
    required VoidCallback onPress,
    required double price,
  }) {
    return ListTile(
      tileColor: Colors.white54,
      leading: Image.network(
        imgUrl,
        width: 70,
        height: 70,
        errorBuilder: (BuildContext context, Object obj, StackTrace? s) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.close,
              size: 35,
              color: redColor,
            ),
          );
        },
      ),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Text('\$${price.toStringAsFixed(2)}'),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      onTap: onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ordersController = Get.find<OrdersController>();
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
            Expanded(
              child: ListView.builder(
                itemCount: ordersController.companies.length,
                itemBuilder: (context, i) {
                  final company = ordersController.companies[i];
                  return buildCompanyListTile(
                    title: company.companyDetails?.name ?? '',
                    subTitle: company.materialName ?? '',
                    imgUrl: company.companyDetails?.logo ?? '',
                    price: company.price ?? 0.0,
                    onPress: () {
                      Get.toNamed(
                        NewOrderScreen.routeName,
                        arguments: {
                          'company': company,
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
