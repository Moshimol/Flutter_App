import 'package:flutter/cupertino.dart';

// 颜色转化工作
Color StringToColor(String colorString) {
  int value = 0x00000000;
  if (colorString.isNotEmpty){

    if (colorString[0] == '#'){
      colorString = colorString.substring(1);
    }


    value = int.tryParse(colorString,radix: 16);

    if (value != null) {
      if (value > 0xFF000000) {
        value += 0xFF000000;
      }
    }
  }

  return Color(value);
}