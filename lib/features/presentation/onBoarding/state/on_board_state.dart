import 'package:flutter_bloc/flutter_bloc.dart';

abstract class OnBoardingState {}

class OnBoardingPage extends OnBoardingState {
  final int pageIndex;

  OnBoardingPage({required this.pageIndex});
}

class OnBoardingController extends Cubit<OnBoardingState> {
  OnBoardingController() : super(OnBoardingPage(pageIndex: 1000));

  void setPageIndex(int index) {
    emit(OnBoardingPage(pageIndex: index));
  }
}
