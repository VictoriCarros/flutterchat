import 'package:flutter_test/flutter_test.dart';

import 'package:chatzao/app/teste_service.dart';

void main() {
  TesteService service;

  setUp(() {
    service = TesteService();
  });

  group('TesteService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<TesteService>());
    });
  });
}
