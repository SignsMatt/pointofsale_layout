import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: ColoredBox(
                color: Colors.blue,
                child: Column(
                  children: [Text('Place Product Selection UI Elements Here.')],
                ),
              ),
            ),
            SizedBox(
              width: 350,
              child: ColoredBox(
                color: Colors.red,
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'Place Order Status and Checkout Elements Here.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
