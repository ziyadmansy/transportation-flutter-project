import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transportation_flutter_project/models/product.dart';
import 'package:transportation_flutter_project/models/shipping_product.dart';
import 'package:transportation_flutter_project/shared/shared_widgets.dart';

import '../shared/api_routes.dart';

class ProductsController extends GetConnect {
  RxList<Product> products = <Product>[].obs;

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
    print(ApiRoutes.addCompanyPrices);
    print(prods);
    Response response = await post(
      ApiRoutes.addCompanyPrices,
      prods
          .map(
            (prod) => {
              'company': SharedWidgets.uid,
              ...prod.toJson(),
            },
          )
          .toList(),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final decodedResponseBody = response.body;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Prices added successfully');
    }
  }
}
