import 'package:flutter/material.dart';

class AppointmentPhoneNumberField extends StatelessWidget {
  const AppointmentPhoneNumberField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Your phone number:',
      ),
      keyboardType: TextInputType.phone,
      autofillHints: const [AutofillHints.telephoneNumber],
      textInputAction: TextInputAction.done,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
