import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:chatzao/app/modules/private_chat/private_chat_controller.dart';
import 'package:chatzao/app/modules/private_chat/private_chat_module.dart';

void main() {
  initModule(PrivateChatModule());
  PrivateChatController privatechat;

  setUp(() {
    privatechat = PrivateChatModule.to.bloc<PrivateChatController>();
  });

  group('PrivateChatController Test', () {
    test("First Test", () {
      expect(privatechat, isInstanceOf<PrivateChatController>());
    });

    test("Set Value", () {
      expect(privatechat.value, equals(0));
      privatechat.increment();
      expect(privatechat.value, equals(1));
    });
  });
}
