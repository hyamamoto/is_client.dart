library test_client_js;

import 'package:unittest/unittest.dart';
import 'package:is_client/is_client.dart' as is_client;
import 'package:is_client/is_dartium.dart' as is_dartium;
import 'package:unittest/html_config.dart';

// Run 'test_client_js.html' by "Run As JavaScript" option.
// Test results should be displayed in a Chrome or whatever
// JavaScript-enabled-browser's window, 
// and exit codes are shown in the editor’s Debugger tab.

main() {
  useHtmlConfiguration();
  setUp((){});
  tearDown((){});
  group('is_client_for_js_browser', () {
    test('Test "is_client" if "isClient" is true',(){ //
      expect(is_client.isClient, true);
      expect(is_client.isServer, false);
    });
    test('Test "is_dartium" if "isJsClient" and "isClient" are both true',(){ //
      expect(is_dartium.isClient, true);
      expect(is_dartium.isServer, false);
      expect(is_dartium.isDartClient, false);
      expect(is_dartium.isJsClient, true);
    });
  });
}
