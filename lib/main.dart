import 'package:flutter/material.dart';
import 'package:pointofsale_layout/widgets/header.dart';

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
            Expanded(child: Column(children: [Header()])),
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
