import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/profile_controller.dart';
import 'package:transportation_flutter_project/shared/shared_widgets.dart';

import '../utils/constants.dart';

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({Key? key}) : super(key: key);

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  final nameController = TextEditingController();
  final profileController = Get.find<ProfileController>();
  Future<void> getProfile() async {
    await profileController.getProfile();
    nameController.text = profileController.name.value;
  }

  Future<void> updateProfile() async {
    await profileController.updateProfile();
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  CheckboxListTile buildChoiceCheckBox({
    required String title,
    required String imgPath,
    required bool value,
    required void Function(bool?)? onChanged,
  }) {
    return CheckboxListTile(
      value: value,
      title: Text(title),
      secondary: Image.asset(imgPath),
      contentPadding: const EdgeInsets.all(16),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/app_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: profileController.imgUrl.value.isEmpty
                          ? null
                          : NetworkImage(
                              profileController.imgUrl.value,
                            ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SharedWidgets.buildClickableTextForm(
                      hint: 'Name',
                      controller: nameController,
                      onChanged: (text) {
                        profileController.name.value = text;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: [
                            buildChoiceCheckBox(
                              title: 'Sea',
                              value: profileController.isSea.value,
                              imgPath: 'assets/imgs/sea_logo.png',
                              onChanged: (isChecked) {
                                if (isChecked != null) {
                                  setState(() {
                                    profileController.isSea.value = isChecked;
                                  });
                                }
                              },
                            ),
                            buildChoiceCheckBox(
                              title: 'Land',
                              value: profileController.isLand.value,
                              imgPath: 'assets/imgs/land_logo.png',
                              onChanged: (isChecked) {
                                if (isChecked != null) {
                                  setState(() {
                                    profileController.isLand.value = isChecked;
                                  });
                                }
                              },
                            ),
                            buildChoiceCheckBox(
                              title: 'Custom',
                              value: profileController.isCustom.value,
                              imgPath: 'assets/imgs/customs_logo.png',
                              onChanged: (isChecked) {
                                if (isChecked != null) {
                                  setState(() {
                                    profileController.isCustom.value =
                                        isChecked;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SharedWidgets.buildElevatedButton(
                      width: Get.width / 2,
                      btnColor: primaryColor,
                      btnText: 'Update',
                      onPress: updateProfile,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
