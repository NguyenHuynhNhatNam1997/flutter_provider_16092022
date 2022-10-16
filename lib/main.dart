import 'package:flutter/material.dart';
import 'demo_basic_provider.dart';
import 'demo_changenotifier_provider.dart';
import 'demo_proxy_provider.dart';
import 'demo_stream_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoStreamProvider(),
    );
  }
}
