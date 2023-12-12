import 'package:flutter/material.dart';

class AppointmentDateField extends StatelessWidget {
  const AppointmentDateField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.initialDate,
    required this.onDateSelected,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;

  final FocusNode focusNode;

  final DateTime initialDate;

  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _selectDate(context),
      controller: controller,
      readOnly: true,
      decoration: const InputDecoration(
        labelText: 'Date',
        hintText: 'Select date',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      focusNode: focusNode,
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
