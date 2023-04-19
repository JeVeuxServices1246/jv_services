import 'dart:math';

import 'package:flutter/material.dart';

import '../constant/app_assets_path.dart';

class CustomCategory extends StatelessWidget {
  final String titleText;

  const CustomCategory({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                titleText,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
            IconButton(
                onPressed: () {
                  // Get.toNamed(MyRouter.servicesScreen);
                },
                constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
                icon: Icon(
                  Icons.adaptive.arrow_forward,
                  size: 22,
                ))
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          color: Colors.white,
          height: min(MediaQuery.of(context).size.height * .134, 110),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 16,
              physics: const BouncingScrollPhysics(),
              itemExtent: MediaQuery.of(context).size.width * .3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xffF3F3F3)),
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      Expanded(flex: 7, child: Image.asset(AppAssets.profile)),
                      const SizedBox(
                        height: 6,
                      ),
                      const Flexible(
                          flex: 4,
                          child: Text(
                            "Women salon",
                            maxLines: 1,
                          ))
                    ],
                  ),
                  // width: 100,
                );
              }),
        )
      ],
    );
  }
}
