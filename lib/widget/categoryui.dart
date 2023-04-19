import 'package:flutter/material.dart';

import '../constant/color.dart';

Widget buildCategoryUI(List categoryList, String img) {
  return Padding(
    padding: const EdgeInsets.only(left: 26, right: 26),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff202020),
              fontFamily: robotMedium),
        ),
        const SizedBox(
          height: 21,
        ),
        GridView.builder(
            itemCount: categoryList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 17,
                mainAxisSpacing: 20,
                childAspectRatio: .9),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xffF3F3F3)),
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      img,
                      width: 50,
                      height: 50,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        categoryList[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff3D3D3D),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              );
            })
      ],
    ),
  );
}
