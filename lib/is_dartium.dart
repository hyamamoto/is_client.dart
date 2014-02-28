/// Properties to check if a Dart application is running on server-side or client-side, Dart browsers or other JS browsers.
/// This library can only be imported by a client-side code since this depends on <code>'dart:html'</code>
library is_dartium;

import 'dart:html'; // Server VM cannot import 'html' library. Use 'is_client' instead of 'is_dartium'.

//
// Publics
//

/// Returns true when running inside the normal browser environment, 
/// either as development or production code. Returns false 
/// if this code is running in a plain Dart VM. This might happen when 
/// running shared code on the server, or during the console unit-testing.
bool get isClient => _D_IS_CLIENT ? true: (_update_vm() & _VM_MASK_CLIENT) != 0;

/// Returns true when running a plain Dart VM. This might happen when 
/// running shared code on the server, or during the console unit-testing.
/// Returns false if this code is running inside the normal browser 
/// environment, either as development or production code. 
bool get isServer => _D_IS_CLIENT ? false: (_update_vm() & _VM_SERVER) != 0;
 
/// Determines whether or not the running program is DartScript or JavaScript.
bool get isDartClient => _D_IS_CLIENT ? false: _update_vm() == _VM_DARTCLIENT;

/// Determines whether or not the running program is JavaScript or DartScript.
bool get isJsClient => _D_IS_CLIENT ? true: _update_vm() == _VM_JSCLIENT;

//
// Utils
//

const _VM_SERVER = 0x01, _VM_DARTCLIENT = 0x06, _VM_JSCLIENT = 0x0A, _VM_MASK_CLIENT = 0x02;
const bool _D_IS_CLIENT = const String.fromEnvironment('IS_CLIENT') != null;

bool _hasFilePath() {
  if (Uri.base.scheme != 'file') return false;
  if (!Uri.base.path.endsWith('/')) return false;
  if (new Uri(path: 'a/b').toFilePath() == 'a\\b') return true; // windows
  return true; // posix
}

int _vm = 0;

bool _is_dart_script() => document.getElementsByTagName("script").where((s) => s.src.endsWith(".dart.js")).isEmpty;

int _update_vm () => _vm == 0 ? (_vm = (_hasFilePath() ? _VM_SERVER: (_is_dart_script() ? _VM_DARTCLIENT: _VM_JSCLIENT))): _vm;
