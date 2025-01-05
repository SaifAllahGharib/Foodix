import 'package:flutter/material.dart';

void snackBar({
  required BuildContext context,
  required String text,
  Color color = Colors.red,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color,
      duration: Duration(milliseconds: 1100),
    ),
  );
}
