import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observable_accessibility/common/services/appointment_service.dart';
import 'package:observable_accessibility/common/services/navigation/presentation/cubit/navigation_cubit.dart';
import 'package:observable_accessibility/common/services/navigation/presentation/screens/main_screen.dart';
import 'package:observable_accessibility/features/appointment_list/cubit/appointment_list_cubit.dart';
import 'package:observable_accessibility/features/appointment_schedluler/cubit/appointement_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final service = AppointmentService(
    sharedPreferences: SharedPreferences.getInstance(),
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => AccessibilityTools(child: child),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            AppointmentListCubit(appointmentService: service)
              ..subscribeToAppointments(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => AppointmentCubit(appointmentService: service),
          ),
          BlocProvider(
            create: (context) => NavigationCubit(),
          ),
        ],
        child: const MainScreen(),
      ),
    ),
  );
}