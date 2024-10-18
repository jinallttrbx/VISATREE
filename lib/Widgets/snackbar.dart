import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showInSnackBar(String value, {Color? color, int? duration}) {
  final SnackBar snackBar = SnackBar(
    key: snackbarKey,
    content: Text(
      value,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    dismissDirection: DismissDirection.up,
    backgroundColor: color ?? Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: duration ?? 1500),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  snackbarKey.currentState?.showSnackBar(snackBar);
}

customSnackBar(BuildContext context, String msg, {Color? color}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    key: snackbarKey,
    content: Text(
      msg,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    dismissDirection: DismissDirection.up,
    backgroundColor: color ?? Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 1500),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ));
}
