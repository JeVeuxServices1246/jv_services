import 'package:flutter/material.dart';

import '../constant/color.dart';

Widget customBtn(String title, Color color, Color textColor, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text( title,style: TextStyle(fontSize: 14,
            fontFamily: popionsMedium,
            fontWeight: FontWeight.w500,
            color: textColor),
            )),
  );
}
