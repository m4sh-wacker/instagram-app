import 'package:flutter/material.dart';

extension Layout on Widget{
  SizedBox Size({double? width , double? height} ){
    return SizedBox(
      width:width ,
      height: height,
      child: this,
    );
  }
}