import 'package:flutter/material.dart';

class OnBoardViewModel extends ChangeNotifier {
  late PageController pageController;

  int _currentPage = 0;

  int get pageIndex => _currentPage;

  set pageIndex(int value) {
    _currentPage = value;
    notifyListeners();
  }
}
