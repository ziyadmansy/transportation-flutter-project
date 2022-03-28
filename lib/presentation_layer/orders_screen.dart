import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/shared/shared_widgets.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = '/ordersScreen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imgs/login_background.png'),
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
              'My Orders',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text('Order $index'),
                      subtitle: Text('Order $index'),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () {},
                    ),
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
