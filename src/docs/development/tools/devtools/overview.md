---
title: DevTools
description: How to use the DevTools with Flutter.
---

## What is DevTools?

DevTools is a suite of performance and debugging tools
for Dart and Flutter. It's currently in preview release,
but is under active development.

![Screenshot of timeline dark mode]({% asset tools/devtools/timeline-dark-mode.png @path %}){:width="100%"}
<br><center>DevTools Timeline view in dark mode</center>

## What can I do with DevTools?

Here are some of the things you can do with DevTools:

* Inspect the UI layout and state of a Flutter app.
* Diagnose UI jank performance issues in a Flutter app.
* Source-level debugging of a Flutter or Dart
  command-line app.
* Debug memory issues in a Flutter or Dart
  command-line app.
* View general log and diagnostics information
  about a running Flutter or Dart
  command-line app.

We expect you to use DevTools in conjunction with
your existing IDE or command-line based development workflow.

![GIF showing DevTools features]({% asset tools/devtools/inspector.gif @path %}){:width="100%"}
<br><center>DevTools in action</center>

## How do I install DevTools?

See the [Android Studio/IntelliJ][], [VS Code][], or
[command line][] pages for installation instructions.

## How do I try DevTools written in Flutter?
To test the alpha version of DevTools written in Flutter, click the “beaker” icon in the upper-right corner of DevTools.
This will launch DevTools running on Flutter web. This version is in early preview with only the inspector tab feature
complete. It is under active development.

![Screenshot of DevTools alpha entry point]({% asset tools/devtools/devtools_alpha_entrypoint.png @path %}){:width="100%"}

## Providing feedback

Please give DevTools a try, provide feedback, and file issues
in the [DevTools issue tracker][]. Thanks!

## Other resources

For more information on debugging and profiling
Flutter apps, see the [Debugging][] page and,
in particular, its list of [other resources][].

For more information on using DevTools with Dart command-line apps, see the 
[DevTools documentation on dart.dev]({{site.dart-site}}/tools/dart-devtools).

[Android Studio/IntelliJ]: /docs/development/tools/devtools/android-studio
[VS Code]: /docs/development/tools/devtools/vscode
[command line]: /docs/development/tools/devtools/cli
[DevTools issue tracker]: {{site.github}}/flutter/devtools/issues
[Debugging]: /docs/testing/debugging
[Other resources]: /docs/testing/debugging#other-resources
