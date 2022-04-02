import 'package:flutter/material.dart';
import 'package:transportation_flutter_project/presentation_layer/company_profile_page.dart';
import 'package:transportation_flutter_project/presentation_layer/orders_page.dart';
import 'package:transportation_flutter_project/presentation_layer/shipping_products_screen.dart';

import '../shared/shared_widgets.dart';
import '../utils/constants.dart';
import 'menu_page.dart';

class CompanyHomeScreen extends StatefulWidget {
  static const String routeName = '/companyHomeScreen';
  const CompanyHomeScreen({Key? key}) : super(key: key);

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  int _selectedBottomNav = 0;
  List<Map<String, Object>> _bottomNavItems = [];

  @override
  void initState() {
    super.initState();
    _bottomNavItems = [
      {
        'title': 'Products',
        'body': ShippingProductsPage(),
      },
      {
        'title': 'Profile',
        'body': CompanyProfilePage(),
      },
      {
        'title': 'Orders',
        'body': OrdersPage(),
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
    return Scaffold(
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
            icon: Icons.supervisor_account,
          ),
          buildBottomNavItem(
            title: _bottomNavItems[1]['title'] as String,
            icon: Icons.account_circle,
          ),
          buildBottomNavItem(
            title: _bottomNavItems[2]['title'] as String,
            icon: Icons.shopping_cart,
          ),
          buildBottomNavItem(
            title: _bottomNavItems[3]['title'] as String,
            icon: Icons.menu,
          ),
        ],
      ),
      body: _bottomNavItems[_selectedBottomNav]['body'] as Widget,
    );
  }
}
