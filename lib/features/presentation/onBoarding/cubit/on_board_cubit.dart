import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jv_services/features/data/models/onBoardingModel/on_board_page.dart';
import 'package:jv_services/features/domain/repository/on_boarding_page/on_boarding_page_repo.dart';

part 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {
  final OnBoardingPageRepo onBoardingPageRepo;
  OnBoardCubit({required this.onBoardingPageRepo}) : super(OnBoardInitial());

  Future<void> getOnBoardPages() async {
    emit(OnBoardGetList(pages: onBoardingPageRepo.getpages()));
  }
}
