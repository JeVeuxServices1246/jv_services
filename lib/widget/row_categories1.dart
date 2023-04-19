import 'dart:math';

import 'package:flutter/material.dart';

import '../constant/app_assets_path.dart';

class CustomCategoryBelowText extends StatelessWidget {
  final String titleText;

  const CustomCategoryBelowText({Key? key, required this.titleText})
      : super(key: key);

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
          height: min(MediaQuery.of(context).size.height * .145, 130),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 16,
              physics: const BouncingScrollPhysics(),
              itemExtent: MediaQuery.of(context).size.width * .3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xffF3F3F3)),
                          margin: const EdgeInsets.only(bottom: 6),
                          padding: const EdgeInsets.all(18),
                          child: Image.asset(AppAssets.profile),
                          // width: 100,
                        ),
                      ),
                      const Text(
                        "Water Purifier",
                        maxLines: 1,
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
