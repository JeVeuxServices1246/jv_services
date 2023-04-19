import 'package:flutter/cupertino.dart';
import 'package:jv_services/utils/extensions/goto.dart';

import '../utils/hive_utils.dart';
import '../utils/session_key.dart';
import 'base_vm.dart';

class OnboardingVM extends BaseViewModel{

  late PageController pageController;
  final int numPages = 4;
  int _currentPage = 0;


  int get pageIndex => _currentPage;

  set pageIndex(int value) {
    _currentPage = value;
    notifyListeners();
  }

  List<Widget> buildPageIndicator() {
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

  @override
  initView() {
    pageController = PageController(initialPage: 0);
    return super.initView();
  }
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }


}