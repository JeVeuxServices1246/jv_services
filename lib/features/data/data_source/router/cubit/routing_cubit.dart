import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jv_services/features/domain/repository/shared_pref/shared_pref_repo.dart';

part 'routing_state.dart';

class RoutingCubit extends Cubit<RoutingState> {
  final SharedPrefRepo sharedPrefRepo;
  RoutingCubit({required this.sharedPrefRepo}) : super(RoutingSplash());

  void gotoNext() {
    bool visited = sharedPrefRepo.isOnBoarded();
    bool isLoggedin = false;
    // ignore: dead_code
    if (isLoggedin) {
      emit(RoutingDashboard());
      return;
    }
    // ignore: dead_code
    if (visited) {
      emit(RoutingWelcome());
      return;
    }
    emit(RoutingOnBoard());
  }

  void login() {
    emit(RoutingDashboard());
  }

  Future<void> setOnBoardVisited() async {
    bool visited = await sharedPrefRepo.setOnBoarded();
    if (!visited) {
      return;
    }
    gotoNext();
  }

  void logout() {
    emit(RoutingWelcome());
  }
}
