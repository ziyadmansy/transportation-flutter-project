import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/models/shipping_product.dart';

import '../buisness_logic_layer/auth_controller.dart';
import '../shared/shared_widgets.dart';
import '../utils/constants.dart';

class ShippingProductsPage extends StatefulWidget {
  const ShippingProductsPage({Key? key}) : super(key: key);

  @override
  State<ShippingProductsPage> createState() => _ShippingProductsPageState();
}

class _ShippingProductsPageState extends State<ShippingProductsPage> {
  final authController = Get.find<AuthController>();

  final formKey = GlobalKey<FormState>();

  RxList<ShippingProduct> seaProducts = <ShippingProduct>[
    ShippingProduct(name: 'first', weight: 0.11),
    ShippingProduct(name: 'second', weight: 5.99),
  ].obs;
  RxList<ShippingProduct> customProducts = <ShippingProduct>[
    ShippingProduct(name: 'first', weight: 0.11),
    ShippingProduct(name: 'second', weight: 5.99),
  ].obs;
  RxList<ShippingProduct> landProducts = <ShippingProduct>[
    ShippingProduct(name: 'first', weight: 0.11),
    ShippingProduct(name: 'second', weight: 5.99),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Sea Freight',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ...seaProducts.map((prod) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SharedWidgets.buildClickableTextForm(
                                    hint: 'Product',
                                    inputType: TextInputType.name,
                                    onChanged: (text) {
                                      prod.name = text;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: SharedWidgets.buildClickableTextForm(
                                    hint: 'Weight',
                                    inputType: TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    onChanged: (text) {
                                      prod.weight = double.tryParse(text) ?? 0;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        SizedBox(
                          height: 16,
                        ),
                        SharedWidgets.buildOutlinedButton(
                          width: Get.width / 2,
                          btnText: 'Add Sea Product',
                          onPress: () {
                            seaProducts.add(ShippingProduct(
                              name: '',
                              weight: 0,
                            ));
                            // seaProducts.refresh();
                          },
                          btnColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Land Freight',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ...landProducts.map((prod) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SharedWidgets.buildClickableTextForm(
                                    hint: 'Product',
                                    inputType: TextInputType.name,
                                    onChanged: (text) {
                                      prod.name = text;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: SharedWidgets.buildClickableTextForm(
                                    hint: 'Weight',
                                    inputType: TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    onChanged: (text) {
                                      prod.weight = double.tryParse(text) ?? 0;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        SizedBox(
                          height: 16,
                        ),
                        SharedWidgets.buildOutlinedButton(
                          width: Get.width / 2,
                          btnText: 'Add Land Product',
                          onPress: () {
                            landProducts.add(ShippingProduct(
                              name: '',
                              weight: 0,
                            ));
                          },
                          btnColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Custom Freight',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ...customProducts.map((prod) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SharedWidgets.buildClickableTextForm(
                                    hint: 'Product',
                                    inputType: TextInputType.name,
                                    onChanged: (text) {
                                      prod.name = text;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: SharedWidgets.buildClickableTextForm(
                                    hint: 'Weight',
                                    inputType: TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    onChanged: (text) {
                                      prod.weight = double.tryParse(text) ?? 0;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        SizedBox(
                          height: 16,
                        ),
                        SharedWidgets.buildOutlinedButton(
                          width: Get.width / 2,
                          btnText: 'Add Custom',
                          onPress: () {
                            customProducts.add(ShippingProduct(
                              name: '',
                              weight: 0,
                            ));
                          },
                          btnColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SharedWidgets.buildElevatedButton(
                  width: Get.width / 2,
                  onPress: () {},
                  btnText: 'Done',
                  btnColor: primaryColor,
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
