import 'package:flutter/material.dart';

class AppointmentTermsField extends StatelessWidget {
  const AppointmentTermsField({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return
        // MergeSemantics around Checkbox and Text. One could also use a
        // [CheckboxListTile]
        MergeSemantics(
      // Instead of Row, a Wrap. Content won't be cut off.
      child: Row(
        children: [
          Checkbox(
            key: const Key('APPOINTMENT_TERMS_CHECKBOX'),
            value: isChecked,
            onChanged: onChanged,
          ),
          // Text.rich instead of Richtext -> text will scale
          const Flexible(
            child: Text.rich(
              TextSpan(
                text: 'I accept the ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'terms and conditions',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
