library is_client;

//
// Publics
//

/// Returns true when running inside the normal browser environment, 
/// either as development or production code. Returns false 
/// if this code is running in a plain Dart VM. This might happen when 
/// running shared code on the server, or during the console unit-testing.
bool get isClient => _D_IS_CLIENT ? true: _isClient();
    
/// Returns true when running a plain Dart VM. This might happen when 
/// running shared code on the server, or during the console unit-testing.
/// Returns false if this code is running inside the normal browser 
/// environment, either as development or production code. 
bool get isServer => _D_IS_CLIENT ? false: _isServer();

//
// Utils
//

const _VM_SERVER = 0x01, _VM_CLIENT = 0x02;
const bool _D_IS_CLIENT = const String.fromEnvironment('IS_CLIENT') != null;
int _vm = 0;
int _update_vm () => _vm == 0 ? (_vm = ( _hasFilePath() ? _VM_SERVER: _VM_CLIENT)): _vm;
bool _isClient() => (_update_vm() & _VM_CLIENT) != 0;
bool _isServer() => (_update_vm() & _VM_SERVER) != 0;
bool _hasFilePath() {
  if (Uri.base.scheme != 'file') return false;
  if (!Uri.base.path.endsWith('/')) return false;
  if (new Uri(path: 'a/b').toFilePath() == 'a\\b') return true; // windows
  return true; // posix
}