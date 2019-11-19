```run-dartpad:theme-dark:mode-flutter:split-60:width-100%:height-400px
{$ begin main.dart $}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlueBox(),
        SizedBox(width: 50),
        BlueBox(),
        BlueBox(),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}
{$ end main.dart $}


{$ begin test.dart $}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        color: Color(0xffeeeeee),
        child: Center(
          child: Container(
            child: MyWidget(),
            color: Color(0xffcccccc),
          ),
        ),
      ),
    );
  }
}

Future<void> main() async {
  
  
  runApp(MyApp());

  final controller = LiveWidgetController(WidgetsBinding.instance);

  final rows = controller.widgetList(find.byType(Row));

  if (rows.length == 0) {
    _result(false, ['Couldn\'t find a Row!']);
    return;
  }

  if (rows.length > 1) {
    _result(false, ['Found ${rows.length} Rows, rather than just one.']);
    return;
  }

  final row = rows.first as Row;

  if (row.mainAxisSize != MainAxisSize.max) {
    _result(false, ['It\'s best to leave the mainAxisSize set to MainAxisSize.max, so there\'s space for the alignments to take effect.']);
    return;
  }
  
  if (row.mainAxisAlignment == MainAxisAlignment.spaceAround 
      || row.mainAxisAlignment == MainAxisAlignment.spaceBetween 
      || row.mainAxisAlignment == MainAxisAlignment.spaceEvenly) {
    _result(false, ['It\'s best to use MainAxisAlignment.start, MainAxisAlignment.end, or MainAxisAlignment.center to see how the SizedBox widgets work in a Row.']);
    return;
  }
  
  if (row.children.length != 5) {
    _result(false, ['The SizedBox widget creates space at 50 logical pixels wide. Add another SizedBox class between the second and third BlueBox widgets with a width property equal to 25 logical pixels.']);
    return;
  }

  if (row.children[0] is! BlueBox) {
    _result(false, ['The Row\'s first child should be a BlueBox widget.']);
    return;
  }

  if (row.children[1] is! SizedBox) {
    _result(false, ['The Row\'s second child should be a SizedBox widget.']);
    return;
  }

  if (row.children[2] is! BlueBox) {
    _result(false, ['The Row\'s third child should be a BlueBox widget.']);
    return;
  }

  if (row.children[3] is! SizedBox) {
    _result(false, ['The Row\'s fourth child should be a SizedBox widget.']);
    return;  
  }
  
   if (row.children[4] is! BlueBox) {
    _result(false, ['The Row\'s fifth child should be a BlueBox widget.']);
    return;
  }
  
  final sizedBox = row.children[1] as SizedBox;
  
  if (sizedBox.width != 50) {
    _result(false, ['The SizedBox should have a width of 50.']);
    return;
  }
  
  final sizedBox2 = row.children[3] as SizedBox;
  
  if (sizedBox2.width != 25) {
    _result(false, ['SizedBox should have a width of 25.']);
    return;
  }
  
  _result(true, ['The SizedBox widgets create space between the BlueBox widgets, one space at 50 logical pixels and one at 25 logical pixels.']);
}
{$ end test.dart $}
```
