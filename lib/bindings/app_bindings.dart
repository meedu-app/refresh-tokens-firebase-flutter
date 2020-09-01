import 'package:get/get.dart';
import 'package:refresh_tokens_with_firebase/controllers/auth_controller.dart';

class AppBindins extends Bindings {
  @override
  void dependencies() {
    print("🎃");
    Get.lazyPut(() => AuthController());
  }
}
