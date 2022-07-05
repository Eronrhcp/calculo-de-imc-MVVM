import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'homeController.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController(); ///faz o gerenciamento de estado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Altura'),
              ),
              onChanged: (value) => controller.setAltura,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Massa'),
              ),
              onChanged: (value) => controller.setMassa,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: controller.callateIMC,
              child: const Text('Calcular'),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, child){
                  return Text(controller.result);
                }),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
