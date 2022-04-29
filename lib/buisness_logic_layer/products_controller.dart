import 'dart:convert';

import 'package:dio/dio.dart' as di;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transportation_flutter_project/models/product.dart';
import 'package:transportation_flutter_project/models/shipping_product.dart';
import 'package:transportation_flutter_project/shared/shared_widgets.dart';

import '../models/company.dart';
import '../shared/api_routes.dart';

class ProductsController extends GetConnect {
  RxList<Product> products = <Product>[].obs;
  RxList<Company> companies = <Company>[].obs;

  Future<void> getProducts() async {
    print(ApiRoutes.systemMaterial);
    Response response = await get(
      ApiRoutes.systemMaterial,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final decodedResponseBody = response.body;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {
      products.value = (decodedResponseBody as List)
          .map((prod) => Product.fromJson(prod))
          .toList();
    }
  }

  Future<void> addProducts(List<ShippingProduct> prods) async {
    try {
      print(ApiRoutes.addCompanyPrices);
      print(prods);
      Response response = await post(
        ApiRoutes.addCompanyPrices,
        prods
            .map(
              (prod) => {
                'company': SharedWidgets.uid.value,
                ...prod.toJson(),
              },
            )
            .toList(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Cache-Control': 'no-store',
        },
      );

      final decodedResponseBody = response.body;
      print(decodedResponseBody);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Prices added successfully');
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    // httpClient.close();
  }

  Future<void> getCompanyPrices() async {
    print('${ApiRoutes.getCompanyPrices(SharedWidgets.uid.value)}?unused=${DateTime.now().toIso8601String()}');
    di.Dio dioHttp = di.Dio();
    di.Response response = await dioHttp.get(
      '${ApiRoutes.getCompanyPrices(SharedWidgets.uid.value)}?unused=${DateTime.now().toIso8601String()}',
      options: di.Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Cache-Control': 'no-store',
        },
      ),
    );

    final decodedResponseBody = response.data;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {
      companies.value = (decodedResponseBody as List)
          .map((prod) => Company.fromJson(prod))
          .toList();
      Get.snackbar('Success', 'Prices Loaded');
    }
  }

  Future<void> deleteCompanyPrice(int itemId) async {
    try {
      print('${ApiRoutes.deleteCompanyPrices(itemId)}?unused=${DateTime.now().toIso8601String()}');
      di.Dio dioHttp = di.Dio();
      di.Response response = await dioHttp.delete(
        '${ApiRoutes.deleteCompanyPrices(itemId)}?unused=${DateTime.now().toIso8601String()}',
        options: di.Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Cache-Control': 'no-store',
          },
        ),
      );

      // final decodedResponseBody = response.body;
      print('response body: ${response.data}');
      print('status code ${response.statusCode}');
      if (response.statusCode == 200) {
        companies.removeWhere((element) => element.id == itemId);
        Get.snackbar('Success', 'Price deleted successfully');
      } else {
        Get.snackbar('Error', response.data.toString());
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString());
    }
  }
}
