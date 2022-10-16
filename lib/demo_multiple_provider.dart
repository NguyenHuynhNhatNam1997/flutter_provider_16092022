import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count1 extends ChangeNotifier {
  late int value;
  Count1({required this.value});

  void InCrease() {
    value += 1;
    notifyListeners();
  }
}

class Count2 extends ChangeNotifier {
  late int value;
  Count2({required this.value});

  void DeCrease() {
    value -= 1;
    notifyListeners();
  }
}

class DemoMutipleProvider extends StatefulWidget {
  const DemoMutipleProvider({Key? key}) : super(key: key);

  @override
  State<DemoMutipleProvider> createState() => _DemoMutipleProviderState();
}

class _DemoMutipleProviderState extends State<DemoMutipleProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Mutiple Provider"),
      ),
      body: Container(
        constraints: const BoxConstraints(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => Count1(value: 0),
            ),
            ChangeNotifierProvider(
              create: (context) => Count2(value: 0),
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Child1Widget(),
              Child2Widget(),
            ],
          ),
        ),
      ),
    );
  }
}

class Child1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Count1>(
        builder: (context, count1, child) {
          return Column(
            children: [
              Text(
                "Count 1 = ${count1.value}",
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    count1.InCrease();
                  },
                  child: Text("InCrease")),
            ],
          );
        },
      ),
    );
  }
}

class Child2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Count2>(
        builder: (context, count2, child) {
          return Column(
            children: [
              Text(
                "Count 1 = ${count2.value}",
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    count2.DeCrease();
                  },
                  child: Text("DeCrease")),
            ],
          );
        },
      ),
    );
  }
}
