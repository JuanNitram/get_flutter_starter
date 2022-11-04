import 'package:flutter/material.dart';

ButtonStyle elevatedButtonPrimaryStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xff469FD1)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
      textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 16)));
}
