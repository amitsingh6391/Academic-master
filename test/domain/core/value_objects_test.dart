import 'package:academic_master/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Email", () {
    test("email should not be null ", () {
      const str = "amit@mail.com";
      final email = EmailAddress(str).isValid();
      debugPrint(email.toString());
      expect(email, true);
    });

    test("password should be greater then 6 digit ", () {
      const str = "12334788";
      final value = Password(str).isValid();

      expect(value, true);
    });
  });
}
