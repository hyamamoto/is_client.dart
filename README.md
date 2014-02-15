# [is_client.dart](http://github.com/hyamamoto/is_client.dart)

"is_client" is a Dart package with properties to check if 
the application is running on server-side or client-side, 
also check if the client is running on a Dart browser 
(Dartium) or other JS browsers (like Chrome/Firefox).

The dead code blocks isolated by the use of is_client utility
can be subjected to the dead code elimination by "dart2js".

[![Build Status](https://drone.io/github.com/hyamamoto/is_client.dart/status.png)](https://drone.io/github.com/hyamamoto/is_client.dart/latest)

* [DartDoc](http://htmlpreview.github.com/?http://github.com/hyamamoto/is_client.dart/blob/master/doc/index.html)

### Example Usage

```
// Sample Code: Check if the code is running on client-side or server-side.

import "package:is_client:is_client.dart"
...
if (isClient) {
  print("Hello! I'm running on client-side!");
} else {
  print("Hello! I'm running on server-side!");
}
```

```
// Sample Code: Check if the code is running as JavaScript or not.

import "package:is_client:is_dartium.dart"
...
if (isDartClient) {
  print("Hello! I'm a Dart on Dartium!");
} else {
  print("Hello! I'm a JavaScript on Chrome or else!");
}
```


### Compile-time dead code elimination

By default, values from is_client package are generated
runtime. They are not treated as the compile-time constants.
Meaning, the code block isolated by if statements WILL NOT be
subjected to the dead code elination feature of "dart2js".

To compile out the dead code, you must pass the IS_CLIENT
constant variable to "dart2js" via the -D command line
arguments.

```
dart2js -DIS_CLIENT=true myapp.dart
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

### License

Code released under the [the MIT license](LICENSE) by Hiroshi Yamamoto \<higon@freepress.jp\>
