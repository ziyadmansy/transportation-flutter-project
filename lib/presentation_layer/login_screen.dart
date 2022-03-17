import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transportation_flutter_project/buisness_logic_layer/auth_controller.dart';
import 'package:transportation_flutter_project/presentation_layer/home_screen.dart';
import 'package:transportation_flutter_project/shared/shared_widgets.dart';
import 'package:transportation_flutter_project/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool isObscure = true;

  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final isValid = formKey.currentState?.validate();
    if (isValid ?? false) {
      FocusScope.of(context).unfocus();

      try {
        setState(() {
          _isLoading = true;
        });
        await authController.loginUser(
            emailController.text, passwordController.text);
        setState(() {
          _isLoading = false;
        });

        Get.offNamed(HomeScreen.routeName);
      } catch (error) {
        SharedWidgets.errorDialog(
          context: context,
          body: ERROR_MESSAGE,
          title: 'Error 404',
          onConfirm: () {
            setState(() {
              _isLoading = false;
            });
            Navigator.of(context).pop();
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
                  Image.asset(
                    'assets/imgs/app_logo.png',
                    width: Get.width / 2,
                    height: Get.width / 2,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: 8,
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
                    hint: 'Password',
                    isObscure: isObscure,
                    textColor: Colors.white,
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
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildElevatedButton(
                    width: Get.width,
                    onPress: _isLoading ? null : login,
                    btnText: 'Log in',
                    btnColor: primaryColor,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Or',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SharedWidgets.buildElevatedButton(
                    width: Get.width,
                    onPress: () {},
                    btnText: 'Log in with Google',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildElevatedButton(
                    onPress: () {},
                    btnText: 'Sign up here',
                    btnColor: primaryColor,
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
