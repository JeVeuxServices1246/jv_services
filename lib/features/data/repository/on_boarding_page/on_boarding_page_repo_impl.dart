import 'package:jv_services/features/data/data_source/onBoardPageDs/on_boarding_page_ds.dart';
import 'package:jv_services/features/data/models/onBoardingModel/on_board_page.dart';
import 'package:jv_services/features/domain/repository/on_boarding_page/on_boarding_page_repo.dart';

class OnBoardingPageRepoImpl extends OnBoardingPageRepo {
  final OnBoardingPageDS onBoardingPageDS;

  OnBoardingPageRepoImpl({required this.onBoardingPageDS});

  @override
  List<OnBoardPage> getpages() {
    return onBoardingPageDS.getpages();
  }
}
