import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  void snackBarError(String message) async {
    final snackBar = SnackBar(
      backgroundColor: Colors.red.shade300,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    final controller = ScaffoldMessenger.of(this).showSnackBar(snackBar);

    await Future.delayed(Duration(seconds: 2));

    controller.close();
  }
}
