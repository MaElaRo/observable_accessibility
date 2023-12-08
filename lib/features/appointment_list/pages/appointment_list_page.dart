import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              if (state is AppointmentListLoaded) {
                return CustomScrollView(
                  semanticChildCount: state.appointments.length,
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return AppointmentListItem(
                            name: state.appointments[index].name,
                            time: '',
                            date: state.appointments[index].timeSlot,
                            onTap: () {
                              context
                                  .read<AppointmentCubit>()
                                  .removeAppointment(
                                    state.appointments[index].code,
                                  );
                            },
                          );
                        },
                        childCount: state.appointments.length,
                      ),
                    ),
                  ],
                );
              } else if (state is AppointmentListFailure) {
                return const Center(
                  child: Text(
                    'Error loading appointments:',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
