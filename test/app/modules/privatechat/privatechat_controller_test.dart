import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:chatzao/app/modules/privatechat/privatechat_controller.dart';
import 'package:chatzao/app/modules/privatechat/privatechat_module.dart';

void main() {
  initModule(PrivatechatModule());
  PrivatechatController privatechat;

  setUp(() {
    privatechat = PrivatechatModule.to.bloc<PrivatechatController>();
  });

  group('PrivatechatController Test', () {
    test("First Test", () {
      expect(privatechat, isInstanceOf<PrivatechatController>());
    });

    test("Set Value", () {
      expect(privatechat.value, equals(0));
      privatechat.increment();
      expect(privatechat.value, equals(1));
    });
  });
}
