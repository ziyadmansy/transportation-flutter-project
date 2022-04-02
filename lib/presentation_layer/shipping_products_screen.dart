import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  Future<void> getProducts() async {
    final productsController = Get.find<ProductsController>();

    await productsController.getCompanyPrices();
  }

  Future<void> deletePriceItem(int id) async {
    final cartController = Get.find<ProductsController>();
    await cartController.deleteCompanyPrice(id);
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
                            'Pricing',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ...productsController.companies.map((comp) {
                            return Slidable(
                              closeOnScroll: true,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ListTile(
                                    title:
                                        Text('${comp.service?.toUpperCase()}'),
                                    subtitle: Text('${comp.materialName}'),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          comp.companyDetails?.logo == null
                                              ? null
                                              : NetworkImage(
                                                  comp.companyDetails?.logo ??
                                                      '',
                                                ),
                                    ),
                                    trailing: Text(
                                      '\$${comp.price}',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // isThreeLine: true,
                                    onTap: null,
                                  ),
                                ),
                              ),
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                extentRatio: 0.25,
                                children: [
                                  SlidableAction(
                                    label: 'Delete',
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    autoClose: true,
                                    onPressed: (context) async {
                                      await deletePriceItem(comp.id!);
                                    },
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
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
