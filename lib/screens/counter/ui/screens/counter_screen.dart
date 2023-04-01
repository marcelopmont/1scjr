import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const String id = '/counter_screen';

  const CounterScreen({
    super.key,
    required this.counter,
    required this.onIncrementPressed,
  });

  final int counter;
  final Function() onIncrementPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onIncrementPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
