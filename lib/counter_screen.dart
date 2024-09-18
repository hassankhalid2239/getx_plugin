import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_plugin/Controllers/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final _counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    print('build....');
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Counter App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                _counterController.counter.toString(),
                style: const TextStyle(
                  fontSize: 50,
                ),
              );
            })
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.redAccent,
          onPressed: () {
            _counterController.increment();
          },
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
