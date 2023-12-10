import 'package:flutter/material.dart';

class AppointmentPhoneNumberField extends StatelessWidget {
  const AppointmentPhoneNumberField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;

  final FocusNode focusNode;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Phone number',
        hintText: 'Enter phone number',
      ),
      keyboardType: TextInputType.phone,
      autofillHints: const [AutofillHints.telephoneNumber],
      textInputAction: TextInputAction.done,
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      validator: (value) {
        if (value == null || value.isEmpty || value.length == 7) {
          return 'Please enter some text';
        }
      },
    );
  }
}
