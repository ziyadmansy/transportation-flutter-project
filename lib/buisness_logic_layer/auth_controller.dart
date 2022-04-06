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
  RxInt uid = (-1).obs;
  RxString userType = ''.obs;

  RxString name = ''.obs;
  RxString img = ''.obs;

  bool isAuth() => uid > 0;

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _isLoggedIn = prefs.getBool(LOGGED_IN_KEY) ?? false;
    if (_isLoggedIn) {
      uid.value = prefs.getInt(uidKey) ?? -1;
      userType.value = prefs.getString(userTypeKey) ?? '';
      print(userType.value);
      uid.refresh();
      return true;
    } else {
      return false;
    }
  }

  Future<void> loginUser(String username, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(ApiRoutes.login);
      Response response = await post(
        ApiRoutes.login,
        json.encode({
          'username': username,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      final decodedResponseBody = response.body;
      print(decodedResponseBody);
      print(response.statusCode);
      if (response.statusCode == 201) {
        uid.value = decodedResponseBody['id'];
        userType.value = decodedResponseBody['type'];
        if (userType.value == consumer) {
          name.value = decodedResponseBody['name'];
          img.value = decodedResponseBody['profile_image'];
        } else {
          name.value = decodedResponseBody['name'];
          img.value = decodedResponseBody['logo'];
        }

        await prefs.setInt(uidKey, uid.value);
        await prefs.setString(userTypeKey, userType.value);
        await prefs.setBool(LOGGED_IN_KEY, true);
        print(uid.value);
        print(userType.value);
        uid.refresh();
      } else {
        throw UnauthenticatedException();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required File image,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(ApiRoutes.consumerRegister);
    var formData = dio.FormData.fromMap({
      'username': email,
      'password': password,
      'name': '$firstName $lastName',
      'profile_image': await dio.MultipartFile.fromFile(
        image.path,
      )
    });
    var response = await dio.Dio().post(
      ApiRoutes.consumerRegister,
      data: formData,
    );

    final decodedResponseBody = response.data;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 201) {
      uid.value = decodedResponseBody['id'];
      await prefs.setInt(uidKey, uid.value);
      await prefs.setString(userTypeKey, consumer);
      await prefs.setBool(LOGGED_IN_KEY, true);
      print(uid.value);
      print(userType.value);
      uid.refresh();
    } else {
      throw UnauthenticatedException();
    }
  }

  Future<void> registerCompany({
    required String name,
    required String email,
    required String password,
    required File image,
    required bool isSea,
    required bool isLand,
    required bool isCustom,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(ApiRoutes.companyRegister);
      var formData = dio.FormData.fromMap({
        'username': email,
        'password': password,
        'name': name,
        'is_sea_freight': isSea,
        'is_land_shipping': isLand,
        'is_customs_clearance': isCustom,
        'logo': await dio.MultipartFile.fromFile(
          image.path,
        ),
      });
      var response = await dio.Dio().post(
        ApiRoutes.companyRegister,
        data: formData,
      );

      final decodedResponseBody = response.data;
      print(decodedResponseBody);
      print(response.statusCode);
      if (response.statusCode == 201) {
        uid.value = decodedResponseBody['id'];
        await prefs.setInt(uidKey, uid.value);
        await prefs.setString(userTypeKey, company);
        await prefs.setBool(LOGGED_IN_KEY, true);
        print(uid.value);
        print(userType.value);
        print(uid.value);
        uid.refresh();
      } else {
        throw UnauthenticatedException();
      }
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
