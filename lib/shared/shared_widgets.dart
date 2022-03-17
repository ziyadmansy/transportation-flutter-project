import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SharedWidgets {
  static AppBar appBar({required String title}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title),
      elevation: 0.0,
    );
  }

  static Widget buildElevatedButton({
    required void Function()? onPress,
    required String btnText,
    Color? btnColor,
    double? width,
    TextStyle? btnTextStyle,
  }) {
    return SizedBox(
      height: 40,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(btnText),
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          onSurface: btnColor,
          textStyle: btnTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
        ),
      ),
    );
  }

  static void errorDialog({
    required BuildContext context,
    VoidCallback? onConfirm,
    String? title,
    String? body,
  }) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: title,
      text: body,
      confirmBtnText: 'Ok',
      onConfirmBtnTap: onConfirm,
    );
  }

  static void successDialog({
    required BuildContext context,
    String? title,
    String? body,
    VoidCallback? onConfirm,
    String confirmBtnText = 'OK',
  }) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: title,
      text: body,
      confirmBtnText: confirmBtnText,
      onConfirmBtnTap: onConfirm,
    );
  }

  static void loadingDialog({
    required BuildContext context,
    String? title,
    String? body,
    VoidCallback? onConfirm,
    required bool dismissable,
  }) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      title: title,
      text: body,
      onConfirmBtnTap: onConfirm,
      barrierDismissible: dismissable,
    );
  }

  static void warningDialog({
    required BuildContext context,
    String? title,
    String? body,
    VoidCallback? onConfirm,
  }) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: title,
      text: body,
      confirmBtnText: 'Ok',
      onConfirmBtnTap: onConfirm,
    );
  }

  static Widget buildClickableTextForm({
    VoidCallback? onClick,
    String? hint,
    String? Function(String? val)? onValidate,
    void Function(String)? onChanged,
    TextEditingController? controller,
    bool isIgnoringTextInput = false,
    bool isEnabled = true,
    String initialText = '',
    TextInputType? inputType,
    Widget? prefix,
    Widget? suffix,
    Color? textColor,
    bool isObscure = false,
    Widget? suffixIcon,
  }) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: IgnorePointer(
        ignoring: isIgnoringTextInput,
        child: TextFormField(
          controller: controller,
          validator: onValidate,
          enabled: isEnabled,
          onChanged: onChanged,
          obscureText: isObscure,
          decoration: InputDecoration(
            enabledBorder: kEnabledBorder,
            focusedBorder: kFocusedBorder,
            disabledBorder: kEnabledBorder,
            hintText: hint,
            labelText: hint,
            prefix: prefix,
            suffix: suffix,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
              color: textColor,
            ),
            labelStyle: TextStyle(
              color: textColor,
            ),
          ),
          style: TextStyle(
            color: textColor,
          ),
          keyboardType: inputType,
        ),
      ),
    );
  }
}
