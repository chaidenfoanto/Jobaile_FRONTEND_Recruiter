import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validator Function', () {
    test('returns error message for empty value', () {
      final String? Function(String?) validator = (value) => value!.isEmpty ? 'Field tidak boleh kosong' : null;
      expect(validator(''), 'Field tidak boleh kosong');
    });

    test('returns null for non-empty value', () {
      final String? Function(String?) validator = (value) => value!.isEmpty ? 'Field tidak boleh kosong' : null;
      expect(validator('some text'), null);
    });
  });
}