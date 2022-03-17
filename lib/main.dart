import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transportation_flutter_project/presentation_layer/home_screen.dart';
import 'package:transportation_flutter_project/shared/initial_app_binding.dart';
import 'package:transportation_flutter_project/utils/constants.dart';

import 'shared/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
    ),
  );
}
