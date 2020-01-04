import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:chatzao/app/modules/singup/singup_page.dart';

main() {
  testWidgets('SingupPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SingupPage(title: 'Singup')));
    final titleFinder = find.text('Singup');
    expect(titleFinder, findsOneWidget);
  });
}
