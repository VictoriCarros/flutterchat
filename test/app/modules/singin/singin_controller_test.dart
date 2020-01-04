import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:chatzao/app/modules/singin/singin_controller.dart';
import 'package:chatzao/app/modules/singin/singin_module.dart';

void main() {
  initModule(SinginModule());
  SinginController singin;

  setUp(() {
    singin = SinginModule.to.bloc<SinginController>();
  });

  group('SinginController Test', () {
    test("First Test", () {
      expect(singin, isInstanceOf<SinginController>());
    });

    test("Set Value", () {
      expect(singin.value, equals(0));
      singin.increment();
      expect(singin.value, equals(1));
    });
  });
}
