library test_server;

import 'package:unittest/unittest.dart';
import 'package:unittest/vm_config.dart';
import '../lib/is_client.dart';


main() {
  useVMConfiguration();
  setUp((){});
  tearDown((){});

  group('is_client_for_server', () {
    test('isServer is true',(){ //
      print(isClient.toString() + ", " + isServer.toString());
      expect(isClient, false);
      expect(isServer, true);
      // expect(isDartClient, false);
      // expect(isJsClient, false);
    });
  });
  
}
