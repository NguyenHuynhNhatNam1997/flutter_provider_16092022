import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoStreamProvider extends StatelessWidget {
  const DemoStreamProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamController<int> streamController = StreamController();
    print("abc");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Stream Provider"),
      ),
      body: Container(
        child: StreamProvider<int>.value(
          value: streamController.stream,
          initialData: 0,
          builder: (context, child) {
            return Consumer<int>(builder: (context, count, child) {
              return Column(
                children: [
                  Text(count.toString()),
                  ElevatedButton(
                    onPressed: () {
                      streamController.sink.add(count - 1);
                    },
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      streamController.sink.add(count + 1);
                    },
                    child: Text('+'),
                  )
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
