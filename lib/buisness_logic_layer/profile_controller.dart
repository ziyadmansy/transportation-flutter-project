import 'package:get/get.dart';

import '../shared/api_routes.dart';

class ProfileController extends GetConnect {
  RxString name = ''.obs;
  RxString imgUrl = ''.obs;
  RxBool isSea = false.obs;
  RxBool isLand = false.obs;
  RxBool isCustom = false.obs;

  Future<void> getProfile() async {
    print(ApiRoutes.companyDetails);
    Response response = await get(
      ApiRoutes.companyDetails,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final Map decodedResponseBody = response.body;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {
      name.value = (decodedResponseBody)['name'];
      imgUrl.value = '${ApiRoutes.baseUrl}${(decodedResponseBody)['logo']}';
      isSea.value = (decodedResponseBody)['is_sea_freight'];
      isLand.value = (decodedResponseBody)['is_land_shipping'];
      isCustom.value = (decodedResponseBody)['is_customs_clearance'];
    }
  }

  Future<void> updateProfile() async {
    print(ApiRoutes.companyDetails);
    Response response = await put(
      ApiRoutes.companyDetails,
      {
        'name': name.value,
        'is_sea_freight': isSea.value,
        'is_land_shipping': isLand.value,
        'is_customs_clearance': isCustom.value,
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final Map decodedResponseBody = response.body;
    print(decodedResponseBody);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Profile updated successfully');
    }
  }
}
