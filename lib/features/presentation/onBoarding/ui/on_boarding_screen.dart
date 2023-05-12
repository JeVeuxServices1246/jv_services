import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/core/constants/app_assets.dart';
import 'package:jv_services/core/constants/strings.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';
import 'package:jv_services/features/presentation/onBoarding/cubit/on_board_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

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
                InkWell(
                  onTap: () {
                    context.read<RoutingCubit>().setOnBoardVisited();
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
                // content
                Expanded(
                    child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            // color: Colors.blue,
                            child: Image(
                              image: const AssetImage(
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
                ))
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
}
