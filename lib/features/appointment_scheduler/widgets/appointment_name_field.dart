import 'package:flutter/material.dart';

class AppointmentNameField extends StatelessWidget {
  const AppointmentNameField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Enter name',
      ),
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
      textInputAction: TextInputAction.done,
      controller: controller,
    );
  }
}
