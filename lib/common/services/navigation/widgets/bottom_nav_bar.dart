import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observable_accessibility/common/services/navigation/domian/bottom_tab.dart';
import 'package:observable_accessibility/common/services/navigation/presentation/cubit/navigation_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.bottomTab.index,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.amber,
          items: _bottomTabItems(false),
          onTap: (index) {
            if (index == 0) {
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(BottomTab.tutorial);
            } else if (index == 1) {
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(BottomTab.addAppointement);
            } else if (index == 2) {
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(BottomTab.appointementList);
            }
          },
        );
      },
    );
  }

  List<BottomNavigationBarItem> _bottomTabItems(bool isSelected) {
    return BottomTab.values
        .map(
          (e) => BottomNavigationBarItem(
        icon: Icon(
          e.getIconData(isSelected: isSelected),
        ),
        label: e.title,
      ),
    )
        .toList();
  }
}
