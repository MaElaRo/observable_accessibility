part of 'appointment_list_cubit.dart';

abstract class AppointmentListState extends Equatable {}

class AppointmentListInitial extends AppointmentListState {
  @override
  List<Object?> get props => [];
}

class AppointmentListLoaded extends AppointmentListState {
  AppointmentListLoaded(this.appointments);

  final List<Appointment> appointments;

  @override
  List<Object?> get props => [appointments];
}

class AppointmentListFailure extends AppointmentListState {
  AppointmentListFailure(this.appointments);

  final List<Appointment> appointments;

  @override
  List<Object?> get props => [appointments];
}
