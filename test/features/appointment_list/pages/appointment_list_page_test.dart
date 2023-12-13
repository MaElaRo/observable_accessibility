import 'package:flutter_test/flutter_test.dart';
import 'package:observable_accessibility/common/navigation/models/bottom_tab.dart';

import '../../../utils/widget_test_helpers.dart';
import '../../appointment_scheduler/pages/appointment_scheduler_page_test_helpers.dart';

void main() {
  group(
    'Appointment list page',
    () {
      testWidgets(
        'should be accessible when empty',
        (WidgetTester tester) async {
          await pumpApp(tester);

          await selectTab(tester, BottomTab.appointmentList);

          checkAccessibilityTraversal(
            tester,
            [
              containsSemantics(
                label: 'Appointment List',
              ),
              containsSemantics(
                label: 'No appointments added yet',
              ),
              containsSemantics(
                label: 'Tutorial\nTab 1 of 3',
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Add Appointment\nTab 2 of 3',
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Appointment List\nTab 3 of 3',
                isSelected: true,
                isFocusable: true,
              ),
            ],
          );
        },
      );

      testWidgets(
        'should be accessible when it contains an appointment',
        (WidgetTester tester) async {
          await pumpApp(tester);

          await addAppointment(tester);

          await selectTab(tester, BottomTab.appointmentList);

          checkAccessibilityTraversal(
            tester,
            [
              containsSemantics(
                label: 'Appointment List',
              ),
              containsSemantics(
                label: 'Rocoo\nAppointment date: 1 at 00\n2023-01-01 - 12:00',
              ),
              containsSemantics(
                label: 'Delete appointment',
              ),
              containsSemantics(
                label: 'Tutorial\nTab 1 of 3',
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Add Appointment\nTab 2 of 3',
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Appointment List\nTab 3 of 3',
                isSelected: true,
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

          await selectTab(tester, BottomTab.appointmentList);

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
