import 'package:flutter/material.dart';
import 'package:jv_services/utils/extensions/goto.dart';

import '../constant/color.dart';

AppBar appBar(BuildContext context,bool isLeading, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: !isLeading
        ? Container()
        : InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              margin: const EdgeInsets.all(6),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffF3F3F3)),
              alignment: Alignment.center,
              child: const Icon(Icons.arrow_back_ios,color: Colors.black,),
            ),
          ),
    centerTitle: true,
    title: Text( title,style: const TextStyle(fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: popionsBold,
        color: Color(0xff000000)),),
  );
}
