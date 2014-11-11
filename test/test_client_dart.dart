library test_client_dart;

import 'package:unittest/unittest.dart';
import 'package:is_client/is_client.dart' as is_client;
import 'package:is_client/is_dartium.dart' as is_dartium;
import 'package:unittest/html_config.dart';

// Run 'test_client_dart.html' by "Run in Dartium" option.
// Test results will be displayed in the Dartium window, 
// and exit codes are shown in the editor’s Debugger tab.

main() {
  useHtmlConfiguration();
  setUp((){});
  tearDown((){});
  group('is_client_for_dart_browser', () {
    test('Test "is_client" if "isClient" is true',(){ //
      expect(is_client.isClient, true);
      expect(is_client.isServer, false);
    });
    test('Test "is_dartium" if "isDartClient" and "isClient" are both true',(){ //
      expect(is_dartium.isClient, true);
      expect(is_dartium.isServer, false);
      expect(is_dartium.isDartClient, true);
      expect(is_dartium.isJsClient, false);
    });
  });
}

