import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/orders_controller.dart';

import '../utils/constants.dart';

class OrdersPage extends StatefulWidget {
  bool isCompany;
  OrdersPage({Key? key, this.isCompany = false}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final ordersController = Get.find<OrdersController>();
  Future<void> getOrder() async {
    await ordersController.getOrders(isCompany: widget.isCompany);
  }

  @override
  void initState() {
    super.initState();
    getOrder();
  }

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
          body: ListView.builder(
            itemCount: ordersController.orders.length,
            itemBuilder: (context, index) {
              final order = ordersController.orders[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title:
                          Text('${order.service.toUpperCase()} - ${order.id}'),
                      subtitle: Text(
                          'From: ${order.fromCountry}\nTo: ${order.toCountry}'),
                      isThreeLine: true,
                      trailing: Text('Weight: ${order.weight}'),
                      onTap: null,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
