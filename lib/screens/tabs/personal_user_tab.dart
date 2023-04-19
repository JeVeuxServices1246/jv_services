import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jv_services/widget/base_widget.dart';

import '../../constant/app_assets_path.dart';
import '../../constant/color.dart';
import '../../view_models/personal_user_tab_vm.dart';
import '../../widget/categoryui.dart';

class PersonalUser extends BaseWidget<PersonalUserVM>{
  const PersonalUser({super.key});

  @override
  Widget buildUI(BuildContext context, PersonalUserVM viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icon/growth_icon.png',
              height: 25,
              width: 25,
            ),
          ),
          title: const Text.rich(
            TextSpan(
                text: 'Personal ',
                style: TextStyle(
                    color: Color(0xff202020),
                    fontWeight: FontWeight.w500,
                    fontFamily: robotMedium,
                    fontSize: 20),
                children: [
                  TextSpan(
                      text: 'Groomig',
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
              buildCategoryUI(viewModel.categoryList, AppAssets.profile),
              const SizedBox(
                height: 24,
              ),
              buildSlider(viewModel),
              const SizedBox(
                height: 35,
              ),
              salonForMen('Salon for men', 'Grooming essentials', 'Haircut',
                  'assets/images/haircut.png'),
              const SizedBox(
                height: 33,
              ),
              salonForMen(
                  'Massage for men',
                  'Curated massages by top therapists.',
                  'Stress relief',
                  'assets/images/head.png'),
              const SizedBox(
                height: 31,
              ),
              salonForMen(
                  'Salon for women', '', 'Waxing', 'assets/images/waxin.png'),
              const SizedBox(
                height: 31,
              ),
              hairAndNailService(),
              const SizedBox(
                height: 42,
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget hairAndNailService() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 26, right: 26),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hair & Nail services',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff202020),
                      fontWeight: FontWeight.w500,
                      fontFamily: robotMedium),
                ),
                Text(
                  'Refreshed style, revamped look',
                  style: TextStyle(
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
          height: 215,
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/hair.png',
                        height: 91,
                        width: 191,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Blowdry: In Curl/ Out Curl',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff3D3D3D),
                            fontWeight: FontWeight.w400),
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

  Widget salonForMen(String title, String des, String text, String img) {
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
          height: 145,
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
                    top: 7,
                    bottom: 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          text,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff565656)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Image.asset(
                        img,
                        height: 91,
                        width: 191,
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget buildSlider(PersonalUserVM viewModel) {
    return Column(
      children: [
        SizedBox(
          height: 190,
          width: double.maxFinite,
          child: CarouselSlider(
            items: List.generate(
                4,
                    (index) => GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/images/Banner.png')),
                  ),
                )),
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                pauseAutoPlayOnTouch: true,
                viewportFraction: .92,
                onPageChanged: (value, _) {
                  viewModel.controlValue = value;
                }),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              4,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: viewModel.controlValue == index
                        ? Colors.black
                        : const Color(0xffE4D6FF),
                  ),
                  height: 8,
                  width: viewModel.controlValue == index ? 32 : 8,
                ),
              )),
        ),
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