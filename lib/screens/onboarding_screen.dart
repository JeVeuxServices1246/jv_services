import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import 'package:jv_services/utils/theme_extension.dart';

import '../constant/app_assets_path.dart';
import '../constant/color.dart';
import '../constant/strings.dart';
import '../view_models/onboarding_vm.dart';
import '../widget/base_widget.dart';
import 'login.dart';


class Onboarding extends BaseWidget<OnboardingVM>{
  const Onboarding({super.key});

  @override
  Widget buildUI(BuildContext context, OnboardingVM viewModel) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap:(){
                context.pushReplacement(Login());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 55,
                    decoration: const BoxDecoration(
                      color: Color(0xffB5EBCD),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: Text(AppStrings.onBoardingSkipButton,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller:viewModel.pageController,
                  onPageChanged: (page) {
                    viewModel.pageIndex = page;
                  },
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              // color: Colors.blue,
                              child: Image(
                                image: AssetImage(
                                  AppAssets.onBoardingOne,
                                ),
                                height: 332,
                                fit: BoxFit.scaleDown,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Text(
                              AppStrings.onBoardingTitleOne,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      height: 1.3,
                                      color: Color(0xff635C5C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: const AssetImage(
                              AppAssets.onBoardingTwo,
                            ),
                            height: 332,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Text(
                            AppStrings.onBoardingTitleTwo,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    height: 1.3,
                                    color: Color(0xff635C5C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: const AssetImage(
                              AppAssets.onBoardingThree,
                            ),
                            height: 332,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: AppStrings.onBoardingTitleThree,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      height: 1.3,
                                      color: Color(0xff635C5C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'more',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        height: 1.3,
                                        color: Color(0xff0B6EFE),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: const AssetImage(
                              AppAssets.onBoardingThree,
                            ),
                            height: 332,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Text(
                            AppStrings.onBoardingTitleFour,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    height: 1.3,
                                    color: Color(0xff635C5C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Image(
                    image: const AssetImage(
                      AppAssets.onBoardingLineLeft,
                    ),
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(AppStrings.onBoardingSkipButton,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      )),
                ),
                Expanded(
                  child: Image(
                    image: const AssetImage(
                      AppAssets.onBoardingLineRight,
                    ),
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: viewModel.buildPageIndicator(),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: viewModel.pageIndex != viewModel.numPages - 1
                    ? Align(
                  alignment: FractionalOffset.center,
                  child: GestureDetector(
                      onTap: () {
                        viewModel.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Container(
                          child: Image.asset(
                            AppAssets.nextOnBoarding,
                            height: 50,
                            width: 50,
                          ))),
                )
                    : SizedBox(
                    height: 44,
                    width: 166,
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        context.pushReplacement(Login());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(AppStrings.onBoardingGetStartButton,
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    )))
          ],
        ),
      ),
    );
  }

}
