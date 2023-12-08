import 'package:flutter/material.dart';

class AppointmentTimeField extends StatelessWidget {
  const AppointmentTimeField({
    Key? key,
    required this.controller,
    required this.initialTime,
    required this.onTimeSelected,
  }) : super(key: key);

  final TextEditingController controller;

  final TimeOfDay initialTime;

  final ValueChanged<TimeOfDay> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Select Time',
        suffixIcon: InkWell(
          onTap: () => _selectTime(context),
          child: const Icon(Icons.access_time),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      onTimeSelected(picked);
    }
  }
}
