

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey[300],
    //appBar
    appBarTheme:    AppBarTheme(
      systemOverlayStyle:  SystemUiOverlayStyle(
        statusBarColor: Colors.grey[300],
      ),
      elevation: 0.0,
      centerTitle: true,
      color: Colors.grey[300],
      titleTextStyle:const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    )
  );
}