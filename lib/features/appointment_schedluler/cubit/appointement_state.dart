import 'package:equatable/equatable.dart';

abstract class AppointmentState extends Equatable {}

class AppointmentInitialLoading extends AppointmentState {
  @override
  List<Object?> get props => [];
}

class AppointmentBookingInProgress extends AppointmentState {
  @override
  List<Object?> get props => [];
}

class AppointmentBookingSuccess extends AppointmentState {
  AppointmentBookingSuccess(this.code);
  final String code;
  @override
  List<Object?> get props => [code];
}

class AppointmentBookingFailure extends AppointmentState {
  AppointmentBookingFailure(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}

class AppointmentRemovingInProgress extends AppointmentState {
  @override
  List<Object?> get props => [];
}

class AppointmentRemovingSuccess extends AppointmentState {
  @override
  List<Object?> get props => [];
}

class AppointmentRemovingFailure extends AppointmentState {
  AppointmentRemovingFailure(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
