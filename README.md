# [is_client.dart](http://github.com/hyamamoto/is_client.dart)

<code>is_client</code> is a small Dart package with properties
(<code>isClient</code>, <code>isDartClient</code>) to check
if your application is running on server-side or client-side.
You can also check if the client-side code is running as Dart 
(on Dartium) or as compiled JavaScript (on Chrome/Firefox/etc).

The dead code blocks isolated by <code>isClient</code> property
value can be subjected to the dead code elimination feature
provided by <code>dart2js</code>, [the Dart to Javascript compiler](https://www.dartlang.org/docs/dart-up-and-running/contents/ch04-tools-dart2js.html).

[![Build Status](https://drone.io/github.com/hyamamoto/is_client.dart/status.png)](https://drone.io/github.com/hyamamoto/is_client.dart/latest)

* [dartdoc/is_client](http://htmlpreview.github.com/?http://github.com/hyamamoto/is_client.dart/blob/master/docs/index.html)
  

### Code Example

```
// Sample Code: Check if the code is running on client-side or server-side.

import "package:is_client:is_client.dart"
...
if ( isClient) {
  print("Hello! I'm running on client-side!");
} else {
  print("Hello! I'm running on server-side!");
}
```

```
// Sample Code: Check if the code is running as JavaScript or not.

import "package:is_client:is_dartium.dart"
...
if ( isDartClient) {
  print("Hello! I'm a Dart on Dartium!");
} else {
  print("Hello! I'm a JavaScript on Chrome or else!");
}
```

### Compile-time dead code elimination

By default, a value for <code>isClient</code> property is 
generated runtime. It is not treated as the compile-time
constants.
Meaning, the code block isolated by <code>if</code> statements
*WILL NOT* be targeted by a dead code elination feature in
<code>dart2js</code>.

To compile out the dead code, you must pass the <code>IS_CLIENT</code>
constant variable to <code>dart2js</code> via the <code>-D</code> command line
arguments.

```
dart2js --minify -DIS_CLIENT=true myapp.dart
```

```
// Code sample
import "package:is_client:is_client.dart"
...
if (isServer) {
  print("Hello! I'm a nonexisting block after dart2js's compilation!");
} else {
  print("Hello! I'm alive!");
}
```

### Change Logs

** 1.2.0 (2/28/2014)**  
* Tested with dart-1.2.0

** 1.1.3 (2/15/2014)**  
* Tested with dart-1.1.0, dart 1.1.3

### License

<code>is_client.dart</code> is released under the [the MIT license](LICENSE) by Hiroshi Yamamoto <higon@freepress.jp>
