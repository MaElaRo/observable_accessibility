import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observable_accessibility/common/services/navigation/domian/bottom_tab.dart';
import 'package:observable_accessibility/common/services/navigation/presentation/cubit/navigation_cubit.dart';
import 'package:observable_accessibility/common/services/navigation/widgets/bottom_nav_bar.dart';
import 'package:observable_accessibility/features/appointment_list/pages/appointment_list_page.dart';
import 'package:observable_accessibility/features/appointment_schedluler/pages/appointment_page.dart';
import 'package:observable_accessibility/features/onboarding/pages/onboarding_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.bottomTab == BottomTab.addAppointement) {
            return const AppointmentPage();
          } else if (state.bottomTab == BottomTab.appointementList) {
            return const AppointmentListPage();
          } else if (state.bottomTab == BottomTab.tutorial) {
            return OnbordingPage();
          }
          return Container();
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
