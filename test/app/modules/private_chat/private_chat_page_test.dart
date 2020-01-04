import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:chatzao/app/modules/private_chat/private_chat_page.dart';

main() {
  testWidgets('PrivateChatPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(PrivateChatPage(title: 'PrivateChat')));
    final titleFinder = find.text('PrivateChat');
    expect(titleFinder, findsOneWidget);
  });
}
