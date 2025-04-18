import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
void configLoading() {
  EasyLoading.instance
    ..loadingStyle=EasyLoadingStyle.custom
    ..dismissOnTap = false
    ..indicatorColor = Colors.white
    ..backgroundColor= Color(0xFF037979)
    ..textColor=Colors.white
    ..progressColor = Colors.white
    ..boxShadow= [
      BoxShadow(
          color: Color(0x29000000),
          offset: Offset(0, 2.0),
          blurRadius: 6.0),
    ];

}
