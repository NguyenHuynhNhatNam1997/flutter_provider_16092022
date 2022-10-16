import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Nhớ là muốn lắng nghe trong provider phải kế thừa extends ChangeNotifier
class Counter extends ChangeNotifier {
  late int value;

  Counter({required this.value});

  void increase() {
    value += 1;
    // notifyListeners() quan trọng dùng để thay đổi dữ liệu mỗi khi có thao tác sự kiện
    notifyListeners();
  }

  void decrease() {
    value -= 1;
    notifyListeners();
  }
}

// Dùng Dagger
class Request {
  late Counter counter1;
  void updateCounter(Counter counter) {
    this.counter1 = counter;
  }
}

class Repository {
  late Request request;
  void updateRequest(Request request) {
    this.request = request;
  }
}

class DemoProxyProvider extends StatefulWidget {
  const DemoProxyProvider({Key? key}) : super(key: key);

  @override
  State<DemoProxyProvider> createState() => _DemoProxyProviderState();
}

class _DemoProxyProviderState extends State<DemoProxyProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Proxy Provider"),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter(value: 0)),
          ProxyProvider<Counter, Request>(
            create: (context) => Request(),
            update: (context, counterRequest, requestPrevious) {
              requestPrevious = Request()..updateCounter(counterRequest);
              return requestPrevious;
            },
          ),
          ProxyProvider<Request, Repository>(
            create: (context) => Repository(),
            update: (context, request, repository) {
              repository = Repository()..updateRequest(request);
              return repository;
            },
          ),
        ],
        child: Consumer<Repository>(
          builder: (context, repository, child) {
            return Container(
              constraints: BoxConstraints.expand(),
              child: Column(
                children: [
                  Text(repository.request.counter1.value.toString()),
                  ElevatedButton(
                    onPressed: () {
                      repository.request.counter1.increase();
                    },
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      repository.request.counter1.decrease();
                    },
                    child: Text("-"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
