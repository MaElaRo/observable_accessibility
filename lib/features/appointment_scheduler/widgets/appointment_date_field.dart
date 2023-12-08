import 'package:flutter/material.dart';

class AppointmentDateField extends StatelessWidget {
  const AppointmentDateField({
    Key? key,
    required this.controller,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  final TextEditingController controller;

  final DateTime initialDate;

  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Select Date',
        suffixIcon: InkWell(
          onTap: () {
            _selectDate(context);
          },
          child: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }
}
