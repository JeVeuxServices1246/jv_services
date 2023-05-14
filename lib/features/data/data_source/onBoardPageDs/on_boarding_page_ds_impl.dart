import 'package:jv_services/features/data/models/onBoardingModel/on_board_page.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/strings.dart';
import 'on_boarding_page_ds.dart';

class OnBoardingPageDSImpl implements OnBoardingPageDS {
  @override
  List<OnBoardPage> getpages() {
    return [
      OnBoardPage(
          title: AppStrings.onBoardingTitleOne,
          desc:
              "Lorem ipsum is a placeholder text commonly used to demonstrate the visual.",
          index: 0,
          image: AppAssets.onBoardingOne),
      OnBoardPage(
          title: AppStrings.onBoardingTitleTwo,
          desc:
              "Lorem ipsum is a placeholder text commonly used to demonstrate the visual.",
          index: 1,
          image: AppAssets.onBoardingTwo),
      OnBoardPage(
          title: AppStrings.onBoardingTitleThree,
          desc:
              "Lorem ipsum is a placeholder text commonly used to demonstrate the visual.",
          index: 2,
          image: AppAssets.onBoardingThree)
    ].toList(growable: false);
  }
}
