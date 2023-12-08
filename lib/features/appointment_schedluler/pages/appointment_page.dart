import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observable_accessibility/features/appointment_schedluler/cubit/appointement_cubit.dart';
import 'package:observable_accessibility/features/appointment_schedluler/cubit/appointement_state.dart';
import 'package:observable_accessibility/features/appointment_schedluler/widgets/date_and_time_picker.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  AppointmentPageState createState() => AppointmentPageState();
}

class AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Scheduler'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<AppointmentCubit, AppointmentState>(
            builder: (context, state) {
              return const DateAndTimePicker();
            },
          ),
        ),
      ),
    );
  }
}
