import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:refresh_tokens_with_firebase/api/my_api.dart';
import 'package:refresh_tokens_with_firebase/models/app_user.dart';
import 'package:refresh_tokens_with_firebase/routes/route_names.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find<AuthController>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser _appUser;
  AppUser get appUser => _appUser;

  Future<AppUser> isLogged() async {
    if (this._auth.currentUser != null) {
      final AppUser appUser = await MyAPI.instance.getUserInfo();
      this._appUser = appUser;
      return this._appUser;
    }
    return null;
  }

  Future<void> singInWithCustomToken(String customToken) async {
    await _auth.signInWithCustomToken(
      customToken,
    );
    AppUser appUser = await MyAPI.instance.getUserInfo();
    this._appUser = appUser;
  }

  Future<String> get idToken => this._auth.currentUser.getIdToken(true);

  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAllNamed(RouteNames.LOGIN);
  }
}
