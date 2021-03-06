import 'package:flutter/material.dart';

final Color? redColor = Colors.red[600];
final Color? greenColor = Colors.greenAccent[700];
const Color primaryColor = Color(0xff013A6D);

const String ERROR_MESSAGE = 'Oops, something went wrong!';
const String INTERNET_ERROR_MESSAGE =
    'Please check your internet connection then try again.';
const String IMAGE_ERROR_MESSAGE = 'Couldn\'t load image';
const String File_ERROR_MESSAGE =
    'Couldn\'t open the File, Incompatibility issue';
const String FILE_FORMAT_MESSAGE =
    'Hint: Supported file formats: jpg, png, pdf';
const String appName = 'Shipping';

const String LOGGED_IN_KEY = 'isLoggedIn';
const String uidKey = 'uidKey';
const String userTypeKey = 'userTypeKey';

const String consumer = 'consumer';
const String company = 'company';

const String sea = 'sea freight';
const String land = 'land_shipping';
const String custom = 'custom clearance';

const int MAX_FILE_SIZE = 1;
const String FILE_SIZE_ERROR_MSG = 'File size can\'t exceed $MAX_FILE_SIZE Mb';

const bool IS_END_DAY_HALF_LEAVE = true;

const int unauthenticatedStatusCode = 401;
const int geofencingPeriodicInterval = 5;

const double kBorderRadius = 8.0;
const double kCardElevation = 8.0;

final kEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kBorderRadius),
  borderSide: const BorderSide(
    width: 1,
    color: Colors.white,
  ),
);

final kFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kBorderRadius),
  borderSide: const BorderSide(
    width: 3,
    color: Colors.white,
  ),
);
