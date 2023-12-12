import 'package:flutter_test/flutter_test.dart';
import 'package:observable_accessibility/common/navigation/models/bottom_tab.dart';

import '../../../util/widget_test_helpers.dart';

void main() {
  group(
    'Onboarding page',
    () {
      testWidgets(
        'should be accessible',
        (WidgetTester tester) async {
          await pumpApp(tester);

          await selectTab(tester, BottomTab.tutorial);

          checkAccessibilityTraversal(
            tester,
            [
              containsSemantics(
                label: 'Tutorial',
              ),
              containsSemantics(
                label: 'Page 1 of 5\nSchedule an appointment\nIt is very easy'
                    ' to schedule an appointment',
              ),
              // TODO: Investigate why this is duplicated.
              containsSemantics(
                label: 'Schedule an appointment\nIt is very easy'
                    ' to schedule an appointment',
              ),
              containsSemantics(
                label: 'Schedule an appointment\nIt is very easy'
                    ' to schedule an appointment',
              ),
              containsSemantics(
                label: 'Tutorial\nTab 1 of 3',
                isSelected: true,
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Add Appointment\nTab 2 of 3',
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
        'should meet accessibility guidelines',
        (WidgetTester tester) async {
          await pumpApp(tester);

          await selectTab(tester, BottomTab.tutorial);

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
