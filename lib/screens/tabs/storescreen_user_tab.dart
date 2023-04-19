import 'package:flutter/material.dart';
import 'package:jv_services/widget/base_widget.dart';

import '../../constant/color.dart';
import '../../view_models/storescreen_user_tab_vm.dart';
import '../../widget/categoryui.dart';

class StoreScreenUser extends BaseWidget<StoreScreenUserVM>{
  const StoreScreenUser({super.key});

  @override
  Widget buildUI(BuildContext context, StoreScreenUserVM viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icon/homeservice_icon.png',
              height: 25,
              width: 25,
            ),
          ),
          title: const Text.rich(
            TextSpan(
                text: 'Home ',
                style: TextStyle(
                    color: Color(0xff202020),
                    fontWeight: FontWeight.w500,
                    fontFamily: robotMedium,
                    fontSize: 20),
                children: [
                  TextSpan(
                      text: 'Store',
                      style: TextStyle(
                          color: Color(0xffBDBDBD),
                          fontWeight: FontWeight.w500,
                          fontFamily: robotMedium,
                          fontSize: 20))
                ]),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchTextField(),
              const SizedBox(
                height: 26,
              ),
              buildCategoryUI(viewModel.categoryList, 'assets/images/rowater.png'),
              const SizedBox(
                height: 33,
              ),
              hardwareAndBathRoomUI(
                  'Hardware store',
                  'Door, windows & cabinet accessories',
                  'assets/images/hardware.png',
                  'Long handle with lock'),
              const SizedBox(
                height: 18,
              ),
              hardwareAndBathRoomUI(
                  'Bathroom makeover',
                  'Products that give you comtort & ease.',
                  'assets/images/shower.png',
                  'Shower head'),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget hardwareAndBathRoomUI(
      String title, String des, String img, String subTitle) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 26, right: 26),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff202020),
                      fontWeight: FontWeight.w500,
                      fontFamily: robotMedium),
                ),
                Text(
                  des,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xffB4B4B4),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/icon/arrow_forward.png',
              height: 10,
              width: 27,
            )
          ]),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
              padding: const EdgeInsets.only(left: 26, top: 17, right: 26),
              separatorBuilder: (context, i) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF4F2F2),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.only(
                          top: 15, left: 12, bottom: 11, right: 17),
                      child: Image.asset(
                        img,
                        height: 55,
                        width: 106,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff3D3D3D),
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text(
                          '\$58.00',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff3D3D3D)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '\$158.00',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffCECECE)),
                        ),
                      ],
                    )
                  ],
                );
              }),
        )
      ],
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffE3E3E3)),
            ),
            hintText: "Search for services",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade700,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14)),
      ),
    );
  }

}