# [is_client.dart](http://github.com/hyamamoto/is_client.dart)

_version 1.6.0 (11/11/2014)_ [![Build Status](https://drone.io/github.com/hyamamoto/is_client.dart/status.png)](https://drone.io/github.com/hyamamoto/is_client.dart/latest)

<code>is_client</code> is a small Dart package with properties
(<code>isClient</code>, <code>isDartClient</code>) to check
if your application is running on server-side or client-side.
You can also check if the client-side code is running as Dart 
(on Dartium) or as compiled JavaScript (on Chrome/Firefox/etc).

The dead code blocks isolated by <code>isClient</code> property
value can be subjected to a dead code elimination feature
provided by <code>dart2js</code>, [the Dart to Javascript compiler](https://www.dartlang.org/docs/dart-up-and-running/contents/ch04-tools-dart2js.html).

### API Document

* http://htmlpreview.github.com/?http://github.com/hyamamoto/is_client.dart/blob/master/docs/index.html
  
### Code Example

```dart
// Exmple: Check if this code is running on client-side or server-side.

import "package:is_client/is_client.dart"
...
if ( isClient) {
  print("Hello! I'm on client-side!");
} else {
  print("Hello! I'm on server-side!");
}
```

```dart
// Example: Check if this code is run as JavaScript or not.

import "package:is_client/is_dartium.dart"
...
if ( isDartClient) {
  print("Hello! I'm running Dart!");
} else {
  print("Hello! I'm running JavaScript!");
}
```

### Compile-time dead code elimination

By default, a value for <code>isClient</code> property is 
generated runtime. It is not treated as the compile-time
constants.
Meaning, code blocks isolated by <code>if</code> statements
*WILL NOT* be targeted by a dead code elination feature in
<code>dart2js</code>.

To compile out the dead code, you must pass a <code>IS_CLIENT</code>
constant variable to <code>dart2js</code> via a <code>-D</code> command
line argument.

```
dart2js --minify -DIS_CLIENT=true myapp.dart
```

```dart
import "package:is_client:is_client.dart"
...
if (isServer) {
  print("Hello! I'm a nonexisting code block compiled out by dart2js!");
} else {
  print("Hello!, client!");
}
```

### Change Logs

** 1.6.0 (11/11/2014)**  
* Dependency bump
* Tested with dart-1.6.0

** 1.2.0 (2/28/2014)**  
* Tested with dart-1.2.0

** 1.1.3 (2/15/2014)**  
* Tested with dart-1.1.0, dart 1.1.3

### License

<code>is_client.dart</code> is released under the [the MIT license](LICENSE) by Hiroshi Yamamoto <higon@freepress.jp>
