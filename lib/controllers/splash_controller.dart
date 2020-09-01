import 'package:get/get.dart';
import 'package:refresh_tokens_with_firebase/controllers/auth_controller.dart';
import 'package:refresh_tokens_with_firebase/routes/route_names.dart';

class SplashControlller extends GetxController {
  @override
  void onReady() {
    _chcek();
  }

  _chcek() async {
    final appUser = await AuthController.instance.isLogged();
    if (appUser != null) {
      Get.offNamed(RouteNames.HOME);
    } else {
      Get.offNamed(RouteNames.LOGIN);
    }
  }
}
