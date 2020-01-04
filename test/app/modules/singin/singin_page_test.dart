import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:chatzao/app/modules/singin/singin_page.dart';

main() {
  testWidgets('SinginPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SinginPage(title: 'Singin')));
    final titleFinder = find.text('Singin');
    expect(titleFinder, findsOneWidget);
  });
}
