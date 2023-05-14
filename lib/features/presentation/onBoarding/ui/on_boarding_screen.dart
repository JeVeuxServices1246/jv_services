import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/core/constants/app_assets.dart';
import 'package:jv_services/core/constants/strings.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';
import 'package:jv_services/features/data/models/onBoardingModel/on_board_page.dart';
import 'package:jv_services/features/presentation/onBoarding/cubit/on_board_cubit.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardCubit, OnBoardState>(
      builder: (context, state) {
        if (state is OnBoardGetList) {
          return Scaffold(
            body: SafeArea(
                child: Column(
              children: [
                // Skip Button top end
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                      child: InkWell(
                        onTap: () {
                          context.read<RoutingCubit>().setOnBoardVisited();
                        },
                        child: Container(
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
                    )),

                // content
                Expanded(
                    child: PageView.builder(
                        itemCount: state.pages.length,
                        controller: pageController,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemBuilder: ((context, index) {
                          OnBoardPage onBoardPage = state.pages[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(
                                      onBoardPage.image,
                                    ),
                                    height: 332,
                                    fit: BoxFit.scaleDown,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Text(
                                    onBoardPage.title,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            height: 1.3,
                                            color: Color(0xff1A1D1F),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    onBoardPage.desc,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            height: 1.3,
                                            color: Color(0xff1A1D1F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  )
                                ],
                              ),
                            ),
                          );
                        }))),
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
                    children: buildPageIndicator(state.pages.length),
                  ),
                ),
                Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                    child: _currentPage != state.pages.length - 1
                        ? Align(
                            alignment: FractionalOffset.center,
                            child: GestureDetector(
                                onTap: () {
                                  pageController.nextPage(
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
                                context
                                    .read<RoutingCubit>()
                                    .setOnBoardVisited();
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
            )),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  List<Widget> buildPageIndicator(int numPages) {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 225),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 10.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF191919) : const Color(0xFFCCCCCC),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

// InkWell(
//                   onTap: () {
//                     context.read<RoutingCubit>().setOnBoardVisited();
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 20, right: 10),
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Container(
//                         width: 55,
//                         decoration: const BoxDecoration(
//                           color: Color(0xffB5EBCD),
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                         ),
//                         padding: const EdgeInsets.only(
//                             left: 10, right: 10, top: 5, bottom: 5),
//                         child: Text(AppStrings.onBoardingSkipButton,
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.inter(
//                               textStyle: const TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15,
//                                 color: Colors.black,
//                               ),
//                             )),
//                       ),
//                     ),
//                   ),
//                 ),
