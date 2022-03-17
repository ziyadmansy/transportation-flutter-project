import 'package:get/get.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/auth_controller.dart';

import '../buisness_logic_layer/home_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
