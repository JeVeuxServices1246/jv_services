import 'package:flutter/material.dart';
import 'package:jv_services/constant/app_assets_path.dart';
import 'package:jv_services/widget/common_text.dart';
import '../constant/dimension.dart';
import '../view_models/home_vm.dart';
import '../widget/base_widget.dart';

class HomeScreen extends BaseWidget<HomeVM>{
  const HomeScreen({super.key});

  @override
  Widget buildUI(BuildContext context, HomeVM viewModel) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: viewModel.scaffoldKey,
        // drawer: const DrawerScreen(),
        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          child: Container(
            height: AddSize.size100 * .6,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                commonButton(
                  onTap: () {
                    viewModel.changeIndex(0);
                  },
                  image: AppAssets.jeLogo,
                  dashBoardText: "JEveux",
                  color: viewModel.currentIndex == 0
                      ? Colors.black
                      : const Color(0xffC4C4C4),
                ),
                commonButton(
                  onTap: () {
                    viewModel.changeIndex(1);
                  },
                  image: AppAssets.userLogo,
                  dashBoardText: "Personal",
                  color: viewModel.currentIndex == 1
                      ? Colors.black
                      : const Color(0xffC4C4C4),
                ),
                commonButton(
                  onTap: () {
                    viewModel.changeIndex(2);
                  },
                  image: AppAssets.homeLogo,
                  dashBoardText: "Home",
                  color: viewModel.currentIndex == 2
                      ? Colors.black
                      : const Color(0xffC4C4C4),
                ),
                commonButton(
                  onTap: () {
                    viewModel.changeIndex(3);
                  },
                  image: AppAssets.splashLogo,
                  dashBoardText: "Store",
                  color: viewModel.currentIndex == 3
                      ? Colors.black
                      : const Color(0xffC4C4C4),
                ),
                commonButton(
                  onTap: () {
                    viewModel.changeIndex(4);
                  },
                  image: AppAssets.account,
                  dashBoardText: "Account",
                  color: viewModel.currentIndex == 4
                      ? Colors.black
                      : const Color(0xffC4C4C4),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
      index: viewModel.currentIndex,
      children: const [
        Text(""),
        Text(""),
        Text(""),
        Text(""),
      ],
    ),

    );
  }
  commonButton(
      {required GestureTapCallback onTap,
        required String image,
        required String dashBoardText,
        required Color color}) {
    return Flexible(
      child: Tooltip(
        message: dashBoardText,
        child: RawMaterialButton(
          onPressed: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: AddSize.size22,
                height: AddSize.size22,
                child: Image.asset(
                  image,
                  color: color,
                ),
              ),
              SizedBox(
                height: AddSize.size10 * .4,
              ),
              AddText(
                text: dashBoardText,
                fontSize: AddSize.font14 * .88,
                fontWeight: FontWeight.w500,
                color: color,
              )
            ],
          ),
        ),
      ),
    );
  }

}
