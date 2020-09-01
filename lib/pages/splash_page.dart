import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:refresh_tokens_with_firebase/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashControlller>(
      init: SplashControlller(),
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
