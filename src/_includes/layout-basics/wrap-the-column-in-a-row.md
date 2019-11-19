```run-dartpad:theme-dark:mode-flutter:split-60:width-100%:height-400px
{$ begin main.dart $}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter McFlutter',
          style: Theme.of(context).textTheme.headline,
        ),
        Text(
          'Experienced App Developer',
        ),
      ],
    );
  }
}
{$ end main.dart $}

{$ begin solution.dart $}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.account_circle, size: 50)),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flutter McFlutter',
                style: Theme.of(context).textTheme.headline),
            Text('Experienced App Developer'),
          ],
        ),
      ],
    );
  }
}
{$ end solution.dart $}

{$ begin test.dart $}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffeeeeee),
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Color(0x80000000),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
              child: MyWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> main() async {
 final completer = Completer<void>();

  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized()
      .addPostFrameCallback((timestamp) async {
    completer.complete();
  });

  await completer.future;

  final controller = LiveWidgetController(WidgetsBinding.instance);

  // Check MyWidget starts with one Column

  final myWidgetElement = controller.element(find.byType(MyWidget));

  final myWidgetChildElements = <Element>[];
  myWidgetElement.visitChildElements((e) => myWidgetChildElements.add(e));

  if (myWidgetChildElements.length != 1 ||
      myWidgetChildElements[0].widget is! Row) {
    _result(false, ['The root widget in MyWidget\'s build method should be a Column.']);
    return;
  }

  // Check first Row has two children: Padding and Column

  final firstRowElement = myWidgetChildElements[0];

  final firstRowChildElements = <Element>[];
  firstRowElement.visitChildElements((e) => firstRowChildElements.add(e));

  if (firstRowChildElements.length != 2 ||
      firstRowChildElements[0].widget is! Padding ||
      firstRowChildElements[1].widget is! Column) {
    _result(false, ['The first Row should have two children: first a Padding, and then a Column.']);
    return;
  }

  // Check Padding has correct padding

  final paddingElement = firstRowChildElements[0];

  if ((paddingElement.widget as Padding).padding != const EdgeInsets.all(8)) {
    _result(false, ['The Padding widget in the first Row should have a padding of 8.']);
    return;
  }

  // Check Padding has an Icon as its child

  final paddingChildren = <Element>[];
  paddingElement.visitChildElements((e) => paddingChildren.add(e));

  if (paddingChildren.length != 1 || paddingChildren[0].widget is! Icon) {
    _result(false, ['The Padding widget in the first Row should have an Icon as its child.']);
    return;
  }

  // Check icon has a size of 50

  if ((paddingChildren[0].widget as Icon).size != 50) {
    _result(false, ['The Icon in the top-left corner should have a size of 50.']);
    return;
  }

  // Check inner Column has correct properties

  final innerColumnElement = firstRowChildElements[1];
  final innerColumnWidget = innerColumnElement.widget as Column;

  if (innerColumnWidget.crossAxisAlignment != CrossAxisAlignment.start) {
    _result(false, ['The Column for the name and title should use CrossAxisAlignment.start as its crosAxisAlignment.']);
    return;
  }

  if (innerColumnWidget.mainAxisSize != MainAxisSize.min) {
    _result(false, ['The Column for the name and title should use MainAxisSize.min as its mainAxisSize.']);
    return;
  }

  // Check inner Column has two Text children

  if (innerColumnWidget.children.any((w) => w is! Text)) {
    _result(false, ['The Column for the name and title should have two children, both Text widgets.']);
    return;
  }

  // Check first Text has headline style

  final nameText = innerColumnWidget.children[0] as Text;

  if (nameText?.style?.fontSize != 24) {
    _result(false, ['The Text widget for the name should use the "headline" textStyle.']);
    return;
  }

  _result(true);
}
{$ end test.dart $}

```