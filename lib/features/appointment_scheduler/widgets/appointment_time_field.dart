import 'package:flutter/material.dart';

class AppointmentTimeField extends StatelessWidget {
  const AppointmentTimeField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.initialTime,
    required this.onTimeSelected,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;

  final FocusNode focusNode;

  final TimeOfDay initialTime;

  final ValueChanged<TimeOfDay> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _selectTime(context),
      controller: controller,
      readOnly: true,
      decoration: const InputDecoration(
        labelText: 'Time',
        hintText: 'Select time',
        suffixIcon: Icon(Icons.access_time),
      ),
      focusNode: focusNode,
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      initialEntryMode: MediaQuery.of(context).accessibleNavigation
          ? TimePickerEntryMode.inputOnly
          : TimePickerEntryMode.dial,
    );

    if (picked != null) {
      onTimeSelected(picked);
    }
  }
}
