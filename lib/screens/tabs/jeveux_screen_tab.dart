import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import 'package:jv_services/utils/extensions/on_stream.dart';
import 'package:jv_services/utils/theme_extension.dart';
import 'package:jv_services/widget/base_widget.dart';
import 'package:badges/badges.dart' as badges;
import '../../constant/app_assets_path.dart';
import '../../constant/color.dart';
import '../../constant/dimension.dart';
import '../../utils/hive_utils.dart';
import '../../utils/session_key.dart';
import '../../view_models/jeveux_screen_tab_vm.dart';
import '../../widget/common_text.dart';
import '../../widget/row_categories.dart';
import '../../widget/row_categories1.dart';
import '../notification_screen.dart';

class JEveuxScreen extends BaseWidget<JEveuxScreenVM>{
  const JEveuxScreen({super.key});

  @override
  Widget buildUI(BuildContext context, JEveuxScreenVM viewModel) {
    Size screenSize = context.mediaSize;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        color: const Color(0xffF2EBFF),
        padding:
        const EdgeInsets.only(top: 16, bottom: 13, left: 18.26, right: 15),
        child: Row(
          children: [
            Image.asset(
              'assets/images/jimi.png',
              height: 40,
              width: 45,
            ),
            const SizedBox(
              width: 9.13,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Jim is on his way for AC Service',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: popionsBold,
                      color: Color(0xff161616)),
                ),
                Text(
                  'Arriving in 12 mins',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff161616),
                      fontFamily: popionsRegular),
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // Get.toNamed(MyRouter.serviceMap);
              },
              child: Container(
                height: 39,
                width: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Image.asset(
                  'assets/icon/forward.png',
                  height: 17,
                  width: 19,
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: InkWell(
          onTap: () {
            showFilterButtonSheet(context,viewModel);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddText(
                text: "Hi, ${HiveUtils.getSession<String>(SessionKey.user,defaultValue: "{}").userModel().firstName}",
                fontSize: 15,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.locationDot,
                    color: Colors.black,
                    size: 14,
                  ),
                  Expanded(
                      child: Text(
                        viewModel.currentAddress,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              )
            ],
          ),
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF5C443)),
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(2),
              child: Image.asset(AppAssets.harry),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context.push(const NotificationScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF3F3F3)),
                  margin: const EdgeInsets.only(right: 14),
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(2),
                  alignment: Alignment.center,
                  child: const badges.Badge(
                    // animationType: BadgeAnimationType.fade,
                    // animationDuration: const Duration(seconds: 1),
                    // position: const BadgePosition(top: -4, end: 2),
                      showBadge: true,
                      child: FaIcon(
                        FontAwesomeIcons.solidBell,
                        color: Colors.black,
                        size: 22,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
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
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 14)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomCategory(titleText: "Self Care Services"),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomCategory(titleText: "Home care services"),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomCategory(titleText: "Construction services"),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.22,
              width: double.maxFinite,
              child: CarouselSlider(
                // autoplay: true,
                // outer: false,
                // autoplayDelay: 5000,
                // autoplayDisableOnInteraction: true,
                // itemBuilder: (BuildContext context, int index) {
                //   return ;
                // },
                items: List.generate(
                    4,
                        (index) => GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                              width: screenSize.width,
                              imageUrl:
                              "https://files.myglamm.com/site-images/original/IDFC-offer-banner-660x330_5.png",
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                              const SizedBox(),
                              errorWidget: (context, url, error) =>
                              const SizedBox()),
                        ),
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
                // itemCount: 10,
                // pagination: const SwiperPagination(),
                // control: const SwiperControl(size: 0), // remove arrows
              ),
            ),
            const SizedBox(
              height: 18,
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
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:
              CustomCategoryBelowText(titleText: "Construction services"),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
  showFilterButtonSheet(BuildContext context, JEveuxScreenVM viewModel) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        isDismissible: true,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * .8,
          maxHeight: MediaQuery.of(context).size.height * .82,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
            ),
          ),
          padding: EdgeInsets.only(
              top: AddSize.padding14,
              left: AddSize.padding20,
              right: AddSize.padding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select a location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    hintText: "Search for area, street name",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade700,
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14)),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Get.toNamed(MyRouter.locationscreen);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.my_location,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Use current location",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            viewModel.currentAddress,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Icon(Icons.adaptive.arrow_forward)
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Saved addresses",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (_, __) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(),
                    ),
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.my_location,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Ayodhya Nagar Extension, Ayodhya Bypass",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Icon(Icons.adaptive.arrow_forward)
                        ],
                      );
                    }),
              )
            ],
          ),
        ));
  }
}