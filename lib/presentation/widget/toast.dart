// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';

Future<void> showToast({
  required String text,
  required ToastStates state,
  required BuildContext context,
}) async {
  String rText = text;
  try {
    final translator = GoogleTranslator();
    final locale = context.locale;
    rText = (await translator.translate(
      text,
      to: locale.languageCode,
    ))
        .text;
  } catch (e) {
    debugPrint('$e');
  }
  Fluttertoast.showToast(
    msg: rText,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

// enum
enum ToastStates { SUCCESS, ERROR, WARNING, NOTE }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.NOTE:
      color = Colors.grey;
      break;
  }
  return color;
}
