import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observable_accessibility/common/model/appointments.dart';
import 'package:observable_accessibility/common/services/appointment_service.dart';
import 'package:observable_accessibility/features/appointment_schedluler/cubit/appointement_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit({
    required AppointmentService appointmentService,
  })  : _appointmentService = appointmentService,
        super(AppointmentInitialLoading());

  final AppointmentService _appointmentService;

  /// Adds an [Appointment].
  ///
  /// This method sets the state to [AppointmentRemovingInProgress] and
  /// checks if appointment is available.
  /// [AppointmentBookingSuccess] is yielded after successful booking. In case
  /// of an error or an unavailable [AppointmentBookingFailure] is yielded.
  Future<void> bookAppointment(Appointment appointment) async {
    emit(AppointmentBookingInProgress());

    try {
      if (await _appointmentService.isAvailable(appointment)) {
        final code = await _appointmentService.bookAppointment(appointment);
        emit(AppointmentBookingSuccess(code));
      } else {
        emit(
          AppointmentBookingFailure(
            'Slot was already taken. Please choose another slot',
          ),
        );
      }
    } catch (error) {
      emit(AppointmentBookingFailure('Booking appointment failed.'));
    }
  }

  /// Remove an appointment from database.
  ///
  /// This method sets the state to [AppointmentRemovingInProgress] and to
  /// [AppointmentRemovingSuccess] after successful removal and
  /// [AppointmentRemovingFailure] if it is unsuccessful.
  Future<void> removeAppointment(String code) async {
    emit(AppointmentRemovingInProgress());
    if (code.isNotEmpty) {
      try {
        await _appointmentService.removeAppointment(code);
        emit(AppointmentRemovingSuccess());
      } catch (error) {
        emit(AppointmentRemovingFailure('Removing appointment failed.'));
      }
    } else {
      emit(AppointmentRemovingFailure('No code found'));
    }
  }

  /// Reset the state to [AppointmentInitialLoading].
  ///
  void resetState() {
    emit(AppointmentInitialLoading());
  }
}
