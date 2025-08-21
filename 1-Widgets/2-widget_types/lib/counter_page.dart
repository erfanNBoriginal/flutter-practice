import 'package:flutter/material.dart';
import 'package:widget_types/counter.dart';

class CounterPage extends StatefulWidget {
  //
  final int initialCount;

  final int counterStep;

  const CounterPage({
    super.key,
    this.initialCount = 0,
    this.counterStep = 1,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  //
  var count = 0;

  void onFACPressed() {
    print('Floating Action Button Pressed');
    print(count);
    setState(() {
      count = count + widget.counterStep;
    });
    print(count);
  }

  @override
  void initState() {
    print('CounterPage init state fired!!!');
    count = widget.initialCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('CounterPage Build Method Fired!');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onFACPressed,
        child: const Icon(Icons.add),
      ),
      body: Counter(
        count: count,
      ),
    );
  }
}
