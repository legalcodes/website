import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';
import 'package:flutter_web_ui/ui.dart' as ui;

const owl_url =
    'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

class FadeInDemo extends StatefulWidget {
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.network(owl_url),
      MaterialButton(
          child: Text(
            'Show Details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => null),
      AnimatedOpacity(
          opacity: opacity,
          child: Column(
            children: <Widget>[
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ))
    ]);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(child: FadeInDemo()),
    ));
  }
}

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  runApp(MyApp());
}
