import 'package:flutter_test/flutter_test.dart';

import '../../../util/widget_test_helpers.dart';
import 'appoinment_scheduler_page_test_helpers.dart';

void main() {
  group(
    'Onboarding page',
    () {
      testWidgets(
        'should be accessible when form is empty',
        (WidgetTester tester) async {
          await pumpApp(tester);

          checkAccessibilityTraversal(
            tester,
            [
              containsSemantics(
                label: 'Appointment Scheduler',
              ),
              containsSemantics(
                label: 'Choose your slot:',
              ),
              containsSemantics(
                label: 'Name',
                isTextField: true,
              ),
              containsSemantics(
                label: 'Date',
                isTextField: true,
                isReadOnly: true,
                currentValueLength: 0,
              ),
              containsSemantics(
                label: 'Time',
                isTextField: true,
                isReadOnly: true,
                currentValueLength: 0,
              ),
              containsSemantics(
                label: 'Phone number',
                isTextField: true,
                currentValueLength: 0,
              ),
              containsSemantics(
                label: 'I accept the terms and conditions',
                hasCheckedState: true,
                hasEnabledState: true,
                isEnabled: true,
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Book slot!',
                isButton: true,
                hasEnabledState: true,
              ),
              containsSemantics(
                label: 'Tutorial\nTab 1 of 3',
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Add Appointment\nTab 2 of 3',
                isSelected: true,
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Appointment List\nTab 3 of 3',
                isFocusable: true,
              ),
            ],
          );
        },
      );

      testWidgets(
        'should be accessible when form was filled out',
        (WidgetTester tester) async {
          await pumpApp(tester);

          await fillOutAppointmentForm(tester);

          checkAccessibilityTraversal(
            tester,
            [
              containsSemantics(
                label: 'Appointment Scheduler',
              ),
              containsSemantics(
                label: 'Choose your slot:',
              ),
              containsSemantics(
                label: 'Name',
                isTextField: true,
              ),
              containsSemantics(
                label: 'Date',
                value: '2023-01-01',
                isTextField: true,
                isReadOnly: true,
                currentValueLength: 10,
              ),
              containsSemantics(
                label: 'Time',
                value: '12:00 AM',
                isTextField: true,
                isReadOnly: true,
                currentValueLength: 8,
              ),
              containsSemantics(
                label: 'Phone number',
                value: '12345678',
                isTextField: true,
                currentValueLength: 8,
              ),
              containsSemantics(
                label: 'I accept the terms and conditions',
                hasCheckedState: true,
                hasEnabledState: true,
                isEnabled: true,
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Book slot!',
                isButton: true,
                hasEnabledState: true,
              ),
              containsSemantics(
                label: 'Tutorial\nTab 1 of 3',
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Add Appointment\nTab 2 of 3',
                isSelected: true,
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Appointment List\nTab 3 of 3',
                isFocusable: true,
              ),
            ],
          );
        },
      );

      testWidgets(
        'should be accessible when form was submitted successfully',
        (WidgetTester tester) async {
          await pumpApp(tester);

          await submitAppointmentForm(tester);

          checkAccessibilityTraversal(
            tester,
            [
              containsSemantics(
                label: 'Success',
              ),
              containsSemantics(
                label: 'Appointment was booked',
              ),
              containsSemantics(
                label: 'OK',
                isButton: true,
                hasEnabledState: true,
                isEnabled: true,
                isFocusable: true,
              ),
            ],
          );
        },
      );

      testWidgets(
        'should meet accessibility guidelines',
        (WidgetTester tester) async {
          await pumpApp(tester);

          final SemanticsHandle handle = tester.ensureSemantics();

          await expectLater(
            tester,
            meetsGuideline(androidTapTargetGuideline),
          );
          await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
          await expectLater(tester, meetsGuideline(textContrastGuideline));

          handle.dispose();
        },
      );
    },
  );
}
