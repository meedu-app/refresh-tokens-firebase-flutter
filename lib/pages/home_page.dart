import 'package:flutter/material.dart';
import 'package:refresh_tokens_with_firebase/controllers/auth_controller.dart';
import 'package:refresh_tokens_with_firebase/models/app_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppUser appUser = AuthController.instance.appUser;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appUser.id),
            Text(appUser.username),
            Text(appUser.email),
            SizedBox(height: 10),
            FlatButton(
              color: Colors.amber,
              onPressed: AuthController.instance.signOut,
              child: Text("SIGN OUT "),
            ),
          ],
        ),
      ),
    );
  }
}
