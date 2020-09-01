import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:refresh_tokens_with_firebase/api/my_api.dart';
import 'package:refresh_tokens_with_firebase/controllers/auth_controller.dart';
import 'package:refresh_tokens_with_firebase/routes/route_names.dart';
import 'package:refresh_tokens_with_firebase/utils/progress_dialog.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> get formKey => _formKey;
  String _email = '', _password = '';

  String validateEmail(String text) {
    _email = text;
    if (text.contains("@")) {
      return null;
    }
    return "Invalid email";
  }

  String validatePassword(String text) {
    _password = text;
    if (text.trim().length > 5) {
      return null;
    }
    return "Invalid password";
  }

  Future<void> submit() async {
    final bool isOk = _formKey.currentState.validate();
    if (isOk) {
      ProgressDialog progressDialog = ProgressDialog(Get.overlayContext);
      progressDialog.show();
      final String customToken = await MyAPI.instance.login(
        email: _email,
        password: _password,
      );
      if (customToken != null) {
        await AuthController.instance.singInWithCustomToken(customToken);
        progressDialog.dismiss();
        Get.offNamed(RouteNames.HOME);
      } else {
        progressDialog.dismiss();
      }
    }
  }
}
