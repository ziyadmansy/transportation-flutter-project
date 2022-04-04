import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transportation_flutter_project/enums/transportation_type.dart';
import 'package:transportation_flutter_project/presentation_layer/orders_page.dart';
import 'package:transportation_flutter_project/presentation_layer/profile_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/transportation_form_screen.dart';
import 'package:transportation_flutter_project/shared/shared_widgets.dart';
import 'package:transportation_flutter_project/utils/constants.dart';

import 'menu_page.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBottomNav = 0;
  List<Map<String, Object>> _bottomNavItems = [];

  @override
  void initState() {
    super.initState();
    _bottomNavItems = [
      {
        'title': 'Shipping',
        'body': ShippingPage(),
      },
      {
        'title': 'Orders',
        'body': OrdersPage(isCompany: false),
      },
      {
        'title': 'Menu',
        'body': MenuPage(),
      },
    ];
  }

  BottomNavigationBarItem buildBottomNavItem({
    required IconData icon,
    required String title,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: title,
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
        appBar: SharedWidgets.appBar(
          // title: _bottomNavItems[_selectedBottomNav]['title'] as String,
          title: '',
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedBottomNav,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 16,
          onTap: (int i) {
            setState(() {
              _selectedBottomNav = i;
            });
          },
          items: [
            buildBottomNavItem(
              title: _bottomNavItems[0]['title'] as String,
              icon: Icons.transfer_within_a_station,
            ),
            buildBottomNavItem(
              title: _bottomNavItems[1]['title'] as String,
              icon: Icons.shopping_cart,
            ),
            buildBottomNavItem(
              title: _bottomNavItems[2]['title'] as String,
              icon: Icons.menu,
            ),
          ],
        ),
        body: _bottomNavItems[_selectedBottomNav]['body'] as Widget,
      ),
    );
  }
}

class ShippingPage extends StatefulWidget {
  const ShippingPage({Key? key}) : super(key: key);

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
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
                  height: 75,
                  width: 75,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(kBorderRadius),
        //         bottomLeft: Radius.circular(kBorderRadius),
        //       ),
        //     ),
        //     child: InkWell(
        //       onTap: () {
        //         Get.toNamed(ProfileScreen.routeName);
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Icon(
        //           Icons.account_circle,
        //           size: 32,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 16,
        ),
        buildTransportationCard(
          title: 'Sea Freight',
          imgPath: 'assets/imgs/sea_logo.png',
          onPressed: () {
            Get.toNamed(
              TransportationFormScreen.routeName,
              arguments: sea,
            );
          },
        ),
        buildTransportationCard(
          title: 'Customs',
          imgPath: 'assets/imgs/customs_logo.png',
          onPressed: () {
            Get.toNamed(
              TransportationFormScreen.routeName,
              arguments: custom,
            );
          },
        ),
        buildTransportationCard(
          title: 'Land Shipping',
          imgPath: 'assets/imgs/land_logo.png',
          onPressed: () {
            Get.toNamed(
              TransportationFormScreen.routeName,
              arguments: land,
            );
          },
        ),
      ],
    );
  }
}
