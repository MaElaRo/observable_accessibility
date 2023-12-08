import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:observable_accessibility/common/model/appointments.dart';
import 'package:observable_accessibility/common/services/appointment_service.dart';

part 'appointment_list_state.dart';

class AppointmentListCubit extends Cubit<AppointmentListState> {
  AppointmentListCubit({
    required AppointmentService appointmentService,
  })  : _appointmentService = appointmentService,
        super(AppointmentListInitial());

  final AppointmentService _appointmentService;

  StreamSubscription<List<Appointment>>? _appointmentsStreamSubscription;

  void subscribeToAppointments() {
    _appointmentsStreamSubscription = _appointmentService.watchAllAppointments().listen(
      (appointments) {
        emit(
          AppointmentListLoaded(appointments),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _appointmentsStreamSubscription?.cancel();

    return super.close();
  }
}
