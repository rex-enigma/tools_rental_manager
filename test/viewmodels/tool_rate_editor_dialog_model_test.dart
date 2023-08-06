import 'package:flutter_test/flutter_test.dart';
import 'package:tools_rental_management/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ToolRateEditorDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
