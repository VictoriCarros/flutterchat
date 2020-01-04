import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:chatzao/app/modules/singup/singup_controller.dart';
import 'package:chatzao/app/modules/singup/singup_module.dart';

void main() {
  initModule(SingupModule());
  SingupController singup;

  setUp(() {
    singup = SingupModule.to.bloc<SingupController>();
  });

  group('SingupController Test', () {
    test("First Test", () {
      expect(singup, isInstanceOf<SingupController>());
    });

    test("Set Value", () {
      expect(singup.value, equals(0));
      singup.increment();
      expect(singup.value, equals(1));
    });
  });
}
