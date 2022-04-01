import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/orders_controller.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/products_controller.dart';
import 'package:transportation_flutter_project/enums/transportation_type.dart';
import 'package:transportation_flutter_project/presentation_layer/payment_screen.dart';
import 'package:transportation_flutter_project/utils/constants.dart';

import '../shared/shared_widgets.dart';
import 'companies_screen.dart';

class TransportationFormScreen extends StatefulWidget {
  static const String routeName = '/transportationFormScreen';
  const TransportationFormScreen({Key? key}) : super(key: key);

  @override
  State<TransportationFormScreen> createState() =>
      _TransportationFormScreenState();
}

class _TransportationFormScreenState extends State<TransportationFormScreen> {
  final weightController = TextEditingController();

  int? selectedProduct;

  String transType = Get.arguments;

  Future<void> makeOrder() async {
    FocusScope.of(context).unfocus();

    if (weightController.text.isEmpty || selectedProduct == null) {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        icon: Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    } else {
      final ordersController = Get.find<OrdersController>();

      await ordersController.getProductCompanies(
        service: transType,
        product: selectedProduct,
        weight: int.tryParse(weightController.text),
      );

      Get.toNamed(
        CompaniesScreen.routeName,
      );
    }
  }

  Future<void> getProducts() async {
    final productsController = Get.find<ProductsController>();

    await productsController.getProducts();
  }

  @override
  void initState() {
    super.initState();
    getProducts();
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
          appBar: SharedWidgets.appBar(title: ''),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      transType.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SharedWidgets.buildBorderedDropDown<int?>(
                    value: selectedProduct,
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
                        selectedProduct = id;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildClickableTextForm(
                    controller: weightController,
                    hint: 'Tons Weight',
                    onClick: null,
                    textColor: Colors.white,
                    inputType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SharedWidgets.buildElevatedButton(
                    onPress: makeOrder,
                    btnText: 'Done',
                    btnColor: primaryColor,
                    width: Get.width / 2,
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
