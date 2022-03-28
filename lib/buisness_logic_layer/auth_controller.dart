import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exceptions/unauthenticated_exception.dart';
import 'package:dio/dio.dart' as dio;
import '../presentation_layer/login_screen.dart';
import '../shared/api_routes.dart';
import '../utils/constants.dart';

class AuthController extends GetConnect {
  var token = ''.obs;
  // RxInt userType = (-1).obs;
  // RxInt vendorId = (-1).obs;

  bool isAuth() => token.isNotEmpty;

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _isLoggedIn = prefs.getBool(LOGGED_IN_KEY) ?? false;
    if (_isLoggedIn) {
      token.value = prefs.getString(TOKEN_KEY) ?? '';
      // userType.value = prefs.getInt(userTypeKey) ?? -1;
      // vendorId.value = prefs.getInt(vendorIdKey) ?? -1;
      return true;
    } else {
      return false;
    }
  }

  Future<void> loginUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(ApiRoutes.login);
    // Response response = await post(
    //   ApiRoutes.login,
    //   json.encode({
    //     'username': username,
    //     'password': password,
    //   }),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //   },
    // );

    // final decodedResponseBody = response.body;
    // print(decodedResponseBody);
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   token.value = decodedResponseBody['token'];
    //   // userType.value = decodedResponseBody['user_type'];
    //   // if (userType.value == 2) {
    //   //   vendorId.value = decodedResponseBody['vendor_id'];
    //   //   await prefs.setInt(vendorIdKey, vendorId.value);
    //   // }
    //   await prefs.setString(TOKEN_KEY, token.value);
    //   // await prefs.setInt(userTypeKey, userType.value);
    //   await prefs.setBool(LOGGED_IN_KEY, true);
    //   print(token);
    // } else {
    //   throw UnauthenticatedException();
    // }
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    print(ApiRoutes.register);
    // Response response = await post(
    //   ApiRoutes.register,
    //   {
    //     'password': password,
    //     'email': email,
    //     'first_name': firstName,
    //     'last_name': lastName,
    //   },
    // );

    // final decodedResponseBody = response.body;
    // print(decodedResponseBody);
    // print(response.statusCode);
    // if (response.statusCode == 201) {
    //   // token = decodedResponseBody['token'];
    //   // print(token);
    // } else {
    //   throw UnauthenticatedException();
    // }
  }

  Future<void> registerCompany({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    try {
      // print(ApiRoutes.register);
      // var formData = dio.FormData.fromMap({
      //   // 'token': SharedWidgets.token.value,
      //   'name': name,
      //   'email': email,
      //   'password': password,
      //   'image': await dio.MultipartFile.fromFile(
      //     image.path,
      //     filename: '$name.jpg',
      //   )
      // });
      // var response = await dio.Dio().post(
      //   ApiRoutes.register,
      //   data: formData,
      // );

      // final decodedResponseBody = response.data;
      // print(decodedResponseBody);
      // print(response.statusCode);
      // if (response.statusCode == 201) {
      //   // Success
      // } else {
      //   throw Exception();
      // }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(LoginScreen.routeName);
  }
}
