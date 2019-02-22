import 'package:flutter_test/flutter_test.dart';

import 'package:computeiro/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    expect(find.text('1'), findsNothing);
  });
}
