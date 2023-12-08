import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observable_accessibility/common/model/appointments.dart';
import 'package:observable_accessibility/features/appointment_list/cubit/appointment_list_cubit.dart';
import 'package:observable_accessibility/features/appointment_list/widgets/appointement_list_item.dart';
import 'package:observable_accessibility/features/appointment_schedluler/cubit/appointement_cubit.dart';

class AppointmentListPage extends StatelessWidget {
  const AppointmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment List'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AppointmentListCubit, AppointmentListState>(
            builder: (context, state) {
              return state.maybeMap(
                loaded: (loaded) {
                  if (loaded.appointments.isNotEmpty) {
                    return _AppointmentsList(
                      appointments: loaded.appointments,
                    );
                  } else {
                    return const Center(
                      child: Text('No appointments added yet'),
                    );
                  }
                },
                failure: (failure) => const Center(
                  child: Text(
                    'Error loading appointments:',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AppointmentsList extends StatelessWidget {
  const _AppointmentsList({
    required this.appointments,
  });

  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: appointments.length,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final appointment = appointments[index];

              return AppointmentListItem(
                name: appointment.name,
                time: '',
                date: appointment.timeSlot,
                onTap: () => context.read<AppointmentCubit>().removeAppointment(
                  appointment.code,
                ),
              );
            },
            childCount: appointments.length,
          ),
        ),
      ],
    );
  }
}
