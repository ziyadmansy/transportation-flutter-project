import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/models/company.dart';
import 'package:transportation_flutter_project/presentation_layer/payment_screen.dart';

import '../buisness_logic_layer/orders_controller.dart';
import '../shared/shared_widgets.dart';
import '../utils/constants.dart';

class NewOrderScreen extends StatefulWidget {
  static const String routeName = '/newOrder';
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  Map args = Get.arguments;

  final fromCountryController = TextEditingController();
  final toCountryController = TextEditingController();
  final weightController = TextEditingController();

  Future<void> makeOrder() async {
    FocusScope.of(context).unfocus();

    if (fromCountryController.text.isEmpty ||
        toCountryController.text.isEmpty ||
        weightController.text.isEmpty) {
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

      await ordersController.makeOrder(
        service: (args['company'] as Company).service!,
        companyId: (args['company'] as Company).companyDetails!.id,
        weight: weightController.text,
        from: fromCountryController.text,
        to: toCountryController.text,
      );

      Get.toNamed(PaymentScreen.routeName);
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
                    (args['company'] as Company).service?.toUpperCase() ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SharedWidgets.buildClickableTextForm(
                        controller: fromCountryController,
                        hint: 'From',
                        isIgnoringTextInput: true,
                        onClick: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              fromCountryController.text = country.name;
                            },
                          );
                        },
                        textColor: Colors.white,
                        onValidate: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'Enter Country';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SharedWidgets.buildClickableTextForm(
                        controller: toCountryController,
                        hint: 'To',
                        isIgnoringTextInput: true,
                        onClick: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              toCountryController.text = country.name;
                            },
                          );
                        },
                        textColor: Colors.white,
                        onValidate: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'Enter Country';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
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
  }
}
