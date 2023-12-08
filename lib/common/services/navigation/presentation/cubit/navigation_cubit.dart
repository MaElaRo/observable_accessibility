import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observable_accessibility/common/services/navigation/domian/bottom_tab.dart';

part 'navigation_cubit.freezed.dart';

part 'navigation_state.dart';

/// [NavigationCubit] is responsible for navigation within the app.
///
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState.tabSelected(BottomTab.addAppointement));

  void getNavBarItem(BottomTab navbarItem) {
    switch (navbarItem) {
      case BottomTab.addAppointement:
        emit(const NavigationState.tabSelected(BottomTab.addAppointement));
        break;
      case BottomTab.appointementList:
        emit(const NavigationState.tabSelected(BottomTab.appointementList));
        break;
      case BottomTab.tutorial:
        emit(const NavigationState.tabSelected(BottomTab.tutorial));
        break;
    }
  }
}
