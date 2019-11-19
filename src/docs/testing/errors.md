---
title: Handling errors in Flutter
description: How to control error messages and logging of errors
---

The Flutter framework catches errors that occur during callbacks
triggered by the framework itself, including during build, layout, and
paint.

All these errors are routed to the
[FlutterError.onError][https://api.flutter.dev/flutter/foundation/FlutterError/onError.html]
handler. By default, this calls
[FlutterError.dumpErrorToConsole][https://api.flutter.dev/flutter/foundation/FlutterError/dumpErrorToConsole.html],
which, as you might guess, dumps the error to the device logs. When
running from an IDE, the inspector overrides this so that errors can
also be routed to the IDE's console, allowing you to inspect the
objects mentioned in the message.

When an error occurs during the build phase, the
[ErrorWidget.builder][https://api.flutter.dev/flutter/widgets/ErrorWidget/builder.html]
callback is invoked to build the widget that is used instead of the
one that failed. By default, in debug mode this shows an error message
in red, and in release mode this shows a gray background.

You can override each of these, typically by setting them to values in
your `void main()` function.

For example, to make your application quit immediately any time an
error is shown in release mode, you could use the following handler:

```dart
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
  runApp(MyApp());
}

// rest of `flutter create` code...
```

This handler can also be used to report errors to a logging service.
For more details, see our cookbook chapter for [reporting errors to a
service][https://flutter.dev/docs/cookbook/maintenance/error-reporting].
