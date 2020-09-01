import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog {
  final BuildContext context;
  ProgressDialog(this.context);

  void show() {
    showCupertinoModalPopup(
      context: this.context,
      builder: (_) => WillPopScope(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black26,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }

  void dismiss() {
    Navigator.pop(context);
  }
}
