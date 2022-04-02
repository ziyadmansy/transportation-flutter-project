import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/models/product.dart';
import 'package:transportation_flutter_project/models/shipping_product.dart';

import '../buisness_logic_layer/auth_controller.dart';
import '../buisness_logic_layer/products_controller.dart';
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

  RxList<ShippingProduct> seaProducts = <ShippingProduct>[].obs;
  RxList<ShippingProduct> customProducts = <ShippingProduct>[].obs;
  RxList<ShippingProduct> landProducts = <ShippingProduct>[].obs;

  Future<void> getProducts() async {
    final productsController = Get.find<ProductsController>();

    await productsController.getProducts();
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> addProducts(List<ShippingProduct> prods) async {
    final productsController = Get.find<ProductsController>();

    await productsController.addProducts(prods);
  }

  @override
  Widget build(BuildContext context) {
    final productsController = Get.find<ProductsController>();
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    child: SharedWidgets.buildBorderedDropDown<
                                        int?>(
                                      value: prod.product?.id,
                                      items: productsController.products
                                          .map(
                                            (element) => DropdownMenuItem<int>(
                                              value: element.id,
                                              child: Text(
                                                element.name,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      hint: 'Products',
                                      onChanged: (id) {
                                        print(id);
                                        setState(() {
                                          prod.product?.id = id!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: SharedWidgets.buildClickableTextForm(
                                      hint: 'Price',
                                      inputType:
                                          TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      onChanged: (text) {
                                        prod.price = double.tryParse(text) ?? 0;
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
                                service: sea,
                                product: Product(id: null, name: ''),
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    child: SharedWidgets.buildBorderedDropDown<
                                        int?>(
                                      value: prod.product?.id,
                                      items: productsController.products
                                          .map(
                                            (element) => DropdownMenuItem<int>(
                                              value: element.id,
                                              child: Text(
                                                element.name,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      hint: 'Products',
                                      onChanged: (id) {
                                        setState(() {
                                          prod.product?.id = id!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: SharedWidgets.buildClickableTextForm(
                                      hint: 'Price',
                                      inputType:
                                          TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      onChanged: (text) {
                                        prod.price = double.tryParse(text) ?? 0;
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
                                service: land,
                                product: Product(id: null, name: ''),
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    child: SharedWidgets.buildBorderedDropDown<
                                        int?>(
                                      value: prod.product?.id,
                                      items: productsController.products
                                          .map(
                                            (element) => DropdownMenuItem<int>(
                                              value: element.id,
                                              child: Text(
                                                element.name,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      hint: 'Products',
                                      onChanged: (id) {
                                        setState(() {
                                          prod.product?.id = id!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: SharedWidgets.buildClickableTextForm(
                                      hint: 'Price',
                                      inputType:
                                          TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      onChanged: (text) {
                                        prod.price = double.tryParse(text) ?? 0;
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
                                service: custom,
                                price: 0,
                                product: Product(id: null, name: ''),
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
                    onPress: () async {
                      var prodList = [
                        ...seaProducts,
                        ...landProducts,
                        ...customProducts,
                      ];
                      await addProducts(prodList);
                    },
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
        ),
      );
    });
  }
}
