part of 'on_board_cubit.dart';

abstract class OnBoardState extends Equatable {
  const OnBoardState();
}

class OnBoardInitial extends OnBoardState {
  @override
  List<Object> get props => [];
}

class OnBoardGetList extends OnBoardState {
  final List<OnBoardPage> pages;

  const OnBoardGetList({required this.pages});

  @override
  List<Object> get props => [pages];
}
