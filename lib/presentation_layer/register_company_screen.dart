import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transportation_flutter_project/presentation_layer/shipping_choices_screen.dart';

import '../buisness_logic_layer/auth_controller.dart';
import '../shared/shared_widgets.dart';
import '../utils/constants.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegisterCompanyScreen extends StatefulWidget {
  static const String routeName = '/registerCompanyScreen';
  const RegisterCompanyScreen({Key? key}) : super(key: key);

  @override
  State<RegisterCompanyScreen> createState() => _RegisterCompanyScreenState();
}

class _RegisterCompanyScreenState extends State<RegisterCompanyScreen> {
  bool isObscure = true;

  XFile? image;

  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> pickImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  Future<void> register() async {
    final isValid = formKey.currentState?.validate();
    if (isValid ?? false) {
      FocusScope.of(context).unfocus();

      try {
        // await authController.registerCompany(
        //   email: emailController.text,
        //   password: passwordController.text,
        //   name: nameController.text,
        //   image: File(image!.path),
        // );

        Get.offNamed(
          ShippingChoicesScreen.routeName,
          arguments: {
            'email': emailController.text,
            'password': passwordController.text,
            'name': nameController.text,
            'image': File(image!.path),
          },
        );
      } catch (error) {
        print(error);
        SharedWidgets.errorDialog(
          context: context,
          body: ERROR_MESSAGE,
          title: 'Error 404',
          onConfirm: () {
            Get.back();
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imgs/login_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SharedWidgets.buildElevatedButton(
                          onPress: pickImageGallery,
                          btnColor: primaryColor,
                          btnText: 'Pick Image',
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      image == null
                          ? Container(
                              height: 100,
                              width: 100,
                              color: Colors.grey,
                              child: Center(
                                child: Text(
                                  'Pick Image',
                                ),
                              ),
                            )
                          : Image.file(
                              File(image!.path),
                              width: 100,
                              height: 100,
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildClickableTextForm(
                    controller: nameController,
                    textColor: Colors.white,
                    hint: 'Company Name',
                    onValidate: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Enter Company Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildClickableTextForm(
                    controller: emailController,
                    textColor: Colors.white,
                    hint: 'Email',
                    onValidate: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Enter your email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildClickableTextForm(
                    controller: passwordController,
                    textColor: Colors.white,
                    hint: 'Password',
                    isObscure: isObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    onValidate: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Enter your Password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildClickableTextForm(
                    controller: confirmPasswordController,
                    textColor: Colors.white,
                    hint: 'Confirm Password',
                    isObscure: isObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    onValidate: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Enter your Confirm Password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SharedWidgets.buildElevatedButton(
                    width: Get.width,
                    onPress: register,
                    btnText: 'Sign up',
                    btnColor: primaryColor,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildOutlinedButton(
                    onPress: () {
                      Get.offNamed(LoginScreen.routeName);
                    },
                    btnText: 'Already have an account? Login',
                    btnColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
