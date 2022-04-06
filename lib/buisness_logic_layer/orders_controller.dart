import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transportation_flutter_project/models/company.dart';
import 'package:transportation_flutter_project/shared/shared_widgets.dart';

import '../models/order.dart';
import '../shared/api_routes.dart';

class OrdersController extends GetConnect {
  RxList<Company> companies = <Company>[].obs;
  RxList<Order> orders = <Order>[].obs;

  Future<void> getOrders({required bool isCompany}) async {
    print(isCompany
        ? ApiRoutes.companyOrders(SharedWidgets.uid.value)
        : ApiRoutes.consumerOrders(SharedWidgets.uid.value));
    Response response = await get(
      isCompany
          ? ApiRoutes.companyOrders(SharedWidgets.uid.value)
          : ApiRoutes.consumerOrders(SharedWidgets.uid.value),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final decodedResponseBody = response.body;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {
      orders.value = (decodedResponseBody as List)
          .map((order) => Order.fromJson(order))
          .toList();
    }
  }

  Future<void> makeOrder({
    required int companyId,
    required String service,
    required String weight,
    required String from,
    required String to,
  }) async {
    print(ApiRoutes.createOrder);
    Response response = await post(
      ApiRoutes.createOrder,
      {
        'company': companyId,
        'consumer': SharedWidgets.uid,
        'weight': weight,
        'service': service,
        'from_country': from,
        'to_country': to,
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final decodedResponseBody = response.body;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {}
  }

  Future<void> getProductCompanies({
    required String service,
    required int? product,
    required int? weight,
  }) async {
    print(ApiRoutes.companiesList);
    Response response = await post(
      ApiRoutes.companiesList,
      {
        'service': service,
        'material': product,
        'weight': weight,
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final decodedResponseBody = response.body;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {
      companies.value = (decodedResponseBody as List)
          .map((e) => Company.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }
}
