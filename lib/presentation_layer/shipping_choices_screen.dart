import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/presentation_layer/company_home_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/shipping_products_screen.dart';

import '../buisness_logic_layer/auth_controller.dart';
import '../shared/shared_widgets.dart';
import '../utils/constants.dart';
import 'orders_page.dart';

class ShippingChoicesScreen extends StatefulWidget {
  static const String routeName = '/shippingChoicesScreen';
  const ShippingChoicesScreen({Key? key}) : super(key: key);

  @override
  State<ShippingChoicesScreen> createState() => _ShippingChoicesScreenState();
}

class _ShippingChoicesScreenState extends State<ShippingChoicesScreen> {
  final authController = Get.find<AuthController>();

  bool _isLoading = false;

  bool isSeaChecked = false;
  bool isLandChecked = false;
  bool isCustomChecked = false;

  CheckboxListTile buildChoiceCheckBox({
    required String title,
    required String imgPath,
    required bool value,
    required void Function(bool?)? onChanged,
  }) {
    return CheckboxListTile(
      value: value,
      title: Text(title),
      secondary: Image.asset(imgPath),
      contentPadding: const EdgeInsets.all(16),
      onChanged: onChanged,
    );
  }

  Future<void> register() async {
    try {
      setState(() {
        _isLoading = true;
      });
      Map args = Get.arguments;
      await authController.registerCompany(
        email: args['email'],
        password: args['password'],
        name: args['name'],
        image: args['image'],
        isSea: isSeaChecked,
        isLand: isLandChecked,
        isCustom: isCustomChecked,
      );
      setState(() {
        _isLoading = false;
      });

      Get.offNamed(CompanyHomeScreen.routeName);
    } catch (error) {
      print(error);
      SharedWidgets.errorDialog(
        context: context,
        body: ERROR_MESSAGE,
        title: 'Error 404',
        onConfirm: () {
          setState(() {
            _isLoading = false;
          });
          Get.back();
        },
      );
    }
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
        appBar: SharedWidgets.appBar(title: ''),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            const Text(
              'Shipping Choices',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    buildChoiceCheckBox(
                      title: 'Sea',
                      value: isSeaChecked,
                      imgPath: 'assets/imgs/sea_logo.png',
                      onChanged: (isChecked) {
                        if (isChecked != null) {
                          setState(() {
                            isSeaChecked = isChecked;
                          });
                        }
                      },
                    ),
                    buildChoiceCheckBox(
                      title: 'Custom',
                      value: isCustomChecked,
                      imgPath: 'assets/imgs/customs_logo.png',
                      onChanged: (isChecked) {
                        if (isChecked != null) {
                          setState(() {
                            isCustomChecked = isChecked;
                          });
                        }
                      },
                    ),
                    buildChoiceCheckBox(
                      title: 'Land',
                      value: isLandChecked,
                      imgPath: 'assets/imgs/land_logo.png',
                      onChanged: (isChecked) {
                        if (isChecked != null) {
                          setState(() {
                            isLandChecked = isChecked;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SharedWidgets.buildElevatedButton(
                      width: Get.width / 2,
                      onPress: _isLoading ? null : register,
                      btnText: 'Done',
                      btnColor: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
