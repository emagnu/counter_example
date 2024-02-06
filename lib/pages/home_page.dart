//    ///
//  Import LIBRRIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import '../main.dart';
//  SIGNALS

//  //  //   ///

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final counter = signal(0);

  void _incrementCounter() {
    debugPrint(" inside _incrementCounter");
    counter.value++;
    debugPrint('    inside counter.value: ${counter.value}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Watch((_) {
            final isDark = brightness() == Brightness.dark;
            return IconButton(
              onPressed: () {
                brightness.value = isDark ? Brightness.light : Brightness.dark;
              },
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            );
          }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Watch((context) {
              print('inside Watch().  Counter value: ${counter.value}');
              return Text(
                '$counter',
                style: Theme.of(context).textTheme.headlineMedium!,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
