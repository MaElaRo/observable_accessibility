import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:observable_accessibility/common/models/appointment.dart';
import 'package:observable_accessibility/common/widgets/primary_card.dart';

class AppointmentListItem extends StatelessWidget {
  const AppointmentListItem({
    super.key,
    required this.appointment,
    this.onTap,
  });

  final Appointment appointment;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      child: PrimaryCard(
        child: Row(
          children: [
            Expanded(
              // Used to read the date with name
              child: MergeSemantics(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AppointmentNameRow(appointment),
                    const SizedBox(
                      height: 20,
                    ),
                    _AppointmentTimeSlotRow(appointment),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              // Size for minimum tap area Material Design
              // You can of course also use IconButton
              child: Semantics(
                label: 'Delete appointment',
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: GestureDetector(
                    onTap: onTap,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppointmentNameRow extends StatelessWidget {
  const _AppointmentNameRow(
    this.appointment, {
    Key? key,
  }) : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.person),
        const SizedBox(
          width: 10,
        ),
        Text(
          appointment.name,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}

class _AppointmentTimeSlotRow extends StatelessWidget {
  const _AppointmentTimeSlotRow(
    this.appointment, {
    Key? key,
  }) : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_month),
        const SizedBox(
          width: 10,
        ),
        Semantics(
          label: 'Appointment date: ${appointment.timeSlot.day} at '
              '${appointment.timeSlot.hour}${appointment.timeSlot.minute}',
          child: Text(
            DateFormat('yyyy-MM-dd - hh:mm').format(appointment.timeSlot),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
