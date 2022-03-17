import 'package:get/get.dart';
import 'package:transportation_flutter_project/presentation_layer/login_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/payment_screen.dart';
import 'package:transportation_flutter_project/presentation_layer/transportation_form_screen.dart';

import '../presentation_layer/home_screen.dart';

class AppPages {
  AppPages._();

  static const String initialRoute = LoginScreen.routeName;

  static final List<GetPage> routes = [
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: TransportationFormScreen.routeName,
      page: () => const TransportationFormScreen(),
    ),
    GetPage(
      name: PaymentScreen.routeName,
      page: () => const PaymentScreen(),
    ),
  ];
}
