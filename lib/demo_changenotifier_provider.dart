import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  late int value;
  Counter({required this.value});

  void inCreaseCount() {
    value += 1;
    notifyListeners();
  }
}

// Phương thức ChangeNotifierProvider lấy dữ liệu kể cả khi trạng thái là Stateless
class DemoChangenotifierProvider extends StatefulWidget {
  const DemoChangenotifierProvider({Key? key}) : super(key: key);

  @override
  State<DemoChangenotifierProvider> createState() =>
      _DemoChangenotifierProviderState();
}

class _DemoChangenotifierProviderState
    extends State<DemoChangenotifierProvider> {
  @override
  Widget build(BuildContext context) {
    print('cha');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Changenotifier Provider"),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        // ChangeNotifierProvider và create: (context) => Counter(value: 0) là lấy giá trị từ class Counter bên trên thông qua BuildContext context
        child: ChangeNotifierProvider<Counter>(
          create: (context) => Counter(value: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(),
              ButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('con 1');
    return Container(
      // Consumer dưới đây là lấy giá trị từ ChangeNotifierProvider và create: (context) => Counter(value: 0) để show ra giao diện
      child: Consumer<Counter>(
        builder: (context, count, child) {
          return Text(count.value.toString());
        },
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of(context);
    print('con 2');
    return ElevatedButton(
      onPressed: () {
        counter.inCreaseCount();
      },
      child: const Text("Increase"),
    );
  }
}
