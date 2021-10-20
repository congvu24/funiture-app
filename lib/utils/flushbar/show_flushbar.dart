import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushBar(BuildContext context, Color color, String text) {
  Flushbar(
    message: text,
    duration: Duration(seconds: 1),
    margin: EdgeInsets.all(8),
    backgroundColor: color,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    flushbarPosition: FlushbarPosition.TOP,
    icon: Icon(
      Icons.info_outline,
      color: Colors.white,
    ),
  )..show(context);
}
