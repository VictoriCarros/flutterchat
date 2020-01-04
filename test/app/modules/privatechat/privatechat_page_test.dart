import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:chatzao/app/modules/privatechat/privatechat_page.dart';

main() {
  testWidgets('PrivatechatPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(PrivatechatPage(title: 'Privatechat')));
    final titleFinder = find.text('Privatechat');
    expect(titleFinder, findsOneWidget);
  });
}
