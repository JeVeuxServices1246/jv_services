
import 'package:flutter/material.dart';

import 'base_vm.dart';

class HomeVM extends BaseViewModel{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  openDrawerFromController() {
    scaffoldKey.currentState!.openDrawer();
  }

  int currentIndex = 0;

  changeIndex(int value) {
    currentIndex = value;
    FocusManager.instance.primaryFocus!.unfocus();
  }

  removeFocus() {
    FocusManager.instance.primaryFocus!.unfocus();
  }


  @override
  initView() {
    return super.initView();
  }


}