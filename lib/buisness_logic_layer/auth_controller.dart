import 'package:get/get.dart';

class AuthController extends GetxController {
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  Future<void> loginUser(String email, String password) async {}
  Future<void> logoutUser() async {}
}
