import 'package:get/get.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/auth_controller.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/orders_controller.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/products_controller.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/profile_controller.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(OrdersController());
    Get.put(ProductsController());
    Get.put(ProfileController());
  }
}
