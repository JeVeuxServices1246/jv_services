import 'package:flutter/material.dart';
import 'package:jv_services/widget/base_widget.dart';

import '../../constant/color.dart';
import '../../view_models/homeservice_tab_vm.dart';
import '../../widget/categoryui.dart';

class HomeService extends BaseWidget<HomeServiceVM>{
  const HomeService({super.key});

  @override
  Widget buildUI(BuildContext context, HomeServiceVM viewModel) {
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
                      text: 'Services',
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              searchTextField(),
              const SizedBox(
                height: 26,
              ),
              buildCategoryUI(viewModel.categoryList, 'assets/images/profits.png'),
              const SizedBox(
                height: 33,
              ),
              browsingAndQuickHomeUI(
                  'Continue browsing for',
                  'Anti-rust deep clean AC service',
                  'assets/images/acservice1.png',
                  235),
              const SizedBox(
                height: 30,
              ),
              applianceRepairUI(viewModel),
              const SizedBox(
                height: 27,
              ),
              browsingAndQuickHomeUI('Quick home repairs',
                  'Drill & hang (wall decor)', 'assets/images/drill.png', 218),
              const SizedBox(
                height: 36,
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget applianceRepairUI(HomeServiceVM viewModel) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 26, right: 26),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Appliance Repair & Service',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff202020),
                  fontWeight: FontWeight.w500,
                  fontFamily: robotMedium),
            ),
            const Spacer(),
            Image.asset(
              'assets/icon/arrow_forward.png',
              height: 10,
              width: 27,
            )
          ]),
        ),
        const SizedBox(
          height: 27,
        ),
        SizedBox(
          height: 135,
          child: ListView.separated(
              separatorBuilder: (context, i) {
                return const SizedBox(
                  width: 14,
                );
              },
              itemCount: viewModel.repairList.length,
              padding: const EdgeInsets.only(left: 26, right: 26),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xffF3F3F3)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Image.asset(
                        'assets/images/repair.png',
                        width: 139,
                        height: 85,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Flexible(
                        child: Text(
                          viewModel.repairList[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xff3D3D3D),
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget browsingAndQuickHomeUI(
      String title, String des, String img, double height) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 26, right: 26),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff202020),
                  fontWeight: FontWeight.w500,
                  fontFamily: robotMedium),
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
          height: height,
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
                return Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF4F2F2),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 4,
                    right: 4,
                    bottom: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        img,
                        height: 91,
                        width: 191,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          des,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff3D3D3D),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/star.png',
                            width: 18,
                            height: 18,
                          ),
                          const Text(
                            '4.73 (427.9k)',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff3D3D3D)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 25,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          '\$58.00',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff3D3D3D)),
                        ),
                      )
                    ],
                  ),
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