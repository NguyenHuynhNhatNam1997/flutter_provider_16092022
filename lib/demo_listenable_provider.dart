import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter {
  ValueNotifier<int> count = ValueNotifier(0);
}

class DemoValueListenable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Valuelistenable Provider"),
      ),
      body: Provider(
        create: (context) => Counter(),
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Consumer<Counter>(
            builder: (context, counter, child) {
              return ValueListenableProvider.value(
                value: counter.count,
                child: Consumer<int>(
                  builder: (context, count, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Count : $count"),
                        ElevatedButton(
                            onPressed: () {
                              counter.count.value += 1;
                            },
                            child: Text("+")),
                        ElevatedButton(
                            onPressed: () {
                              counter.count.value -= 1;
                            },
                            child: Text("-"))
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
