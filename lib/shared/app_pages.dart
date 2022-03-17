import 'package:get/get.dart';

import '../presentation_layer/home_screen.dart';


class AppPages {
  AppPages._();

  static final List<GetPage> routes = [
    GetPage(
      name: HomeScreen.routeName,
      page: () => HomeScreen(),
    ),
  ];
}
