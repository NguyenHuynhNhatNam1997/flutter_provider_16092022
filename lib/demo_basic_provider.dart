import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoBasicProvider extends StatefulWidget {
  const DemoBasicProvider({Key? key}) : super(key: key);

  @override
  State<DemoBasicProvider> createState() => _DemoBasicProviderState();
}

class _DemoBasicProviderState extends State<DemoBasicProvider> {
  String textDemo = 'Phat 2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo basic provider"),
      ),
      body: Container(
        child: Provider.value(
          value: textDemo,
          child: Column(
            children: [Child1Widget(), Child2Widget()],
          ),
        ),
      ),
    );
  }
}

class Child1Widget extends StatelessWidget {
  const Child1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String textChild1 = Provider.of(context);
    return Container(
      child: Text(textChild1),
    );
  }
}

class Child2Widget extends StatelessWidget {
  const Child2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Consumer Lấy giá trị ra và giá trị đó có thể chuyển động
      child: Consumer<String>(builder: (context, textDemo2, child) {
        return Text(textDemo2);
      }),
    );
  }
}
