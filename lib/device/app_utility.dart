
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/resource/app_colors.dart';

class AppUtility {
  static bool isShowing = false;

  static void showProgressDialog(BuildContext context, {from}) {
    isShowing = true;
    showDialog(
        barrierDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.red),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void hideProgressDialog(BuildContext context) {
    if (isShowing) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      isShowing = false;
    }
  }

  static hideKeyboard(context) {
    try {
      FocusScope.of(context).unfocus();
    } catch (e) {}
  }

  static void showGreenToastMessage(context, String message) {
    FToast fToast = FToast().init(context);
    fToast.showToast(
        toastDuration: const Duration(seconds: 2),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsets.all(12),
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          decoration:  BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }

  static void showRedToastMessage(context, String message) {
    FToast fToast = FToast().init(context);
    fToast.showToast(
        toastDuration: const Duration(seconds: 2),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsets.all(12),
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          decoration:  BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ));
  }
}
