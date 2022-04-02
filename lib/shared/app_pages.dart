import 'package:get/get.dart';
import 'package:transportation_flutter_project/presentation_layer/company_home_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/login_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/new_order_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/orders_page.dart';
import 'package:transportation_flutter_project/presentation_layer/payment_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/shipping_choices_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/shipping_products_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/transportation_form_screen.dart';

import '../presentation_layer/companies_screen.dart';
import '../presentation_layer/home_screen.dart';
import '../presentation_layer/profile_screen.dart';
import '../presentation_layer/register_company_screen.dart';
import '../presentation_layer/register_screen.dart';
import '../presentation_layer/splash_screen.dart';

class AppPages {
  AppPages._();

  static const String initialRoute = SplashScreen.routeName;

  static final List<GetPage> routes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RegisterScreen.routeName,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: RegisterCompanyScreen.routeName,
      page: () => const RegisterCompanyScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: TransportationFormScreen.routeName,
      page: () => const TransportationFormScreen(),
    ),
    GetPage(
      name: PaymentScreen.routeName,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: CompaniesScreen.routeName,
      page: () => const CompaniesScreen(),
    ),
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: ShippingChoicesScreen.routeName,
      page: () => const ShippingChoicesScreen(),
    ),
    GetPage(
      name: NewOrderScreen.routeName,
      page: () => const NewOrderScreen(),
    ),
    GetPage(
      name: CompanyHomeScreen.routeName,
      page: () => const CompanyHomeScreen(),
    ),
  ];
}
