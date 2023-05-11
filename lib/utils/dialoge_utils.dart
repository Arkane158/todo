import 'package:flutter/material.dart';

class DialogeUtils {
  static void showProgressDialog(BuildContext _, String message,
      {bool isDismissible = true}) {
    showDialog(
      context: _,
      builder: (_) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 12,
              ),
              Text(message),
            ],
          ),
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  static void showMessage(BuildContext context, String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      String? negActionTitle}) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (posAction != null) {
              posAction;
            }
          },
          child: Text(posActionTitle)));
    }
    if (negActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            if (negAction != null) {
              negAction;
            }
          },
          child: Text(negActionTitle)));
    }

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(message),
            actions: actions,
          );
        });
  }

  static void hideDialog(BuildContext _) {
    Navigator.pop(_);
  }
}
