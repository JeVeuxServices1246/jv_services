import 'package:flutter/material.dart';
import '../widget/base_widget.dart';

extension Space on BaseWidget{
  SizedBox spaceX({double extra = 0}) {
    return SizedBox(width: 5+extra);
  }
  SizedBox spaceY({double extra = 0}) {
    return SizedBox(height: 5+extra);
  }
}