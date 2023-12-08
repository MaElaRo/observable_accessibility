import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final DateTime timeSlot;
  final String name;
  final String code;

  const Appointment({
    required this.name,
    required this.timeSlot,
    required this.code,
  });

  @override
  List<Object?> get props => [timeSlot, name, code];

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      name: json['name'],
      timeSlot: DateTime.parse(json['timeSlot']),
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'timeSlot': timeSlot.toIso8601String(),
    'code': code,
  };
}
