import 'package:flutter/material.dart';

extension CenterExtension on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }
}