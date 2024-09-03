import 'package:chess_onitama/widgets/onitama/onitama_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Pecita'),
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
          children: [
            Text("Onitama",
                style: TextStyle(color: Colors.white, fontSize: 30)),
            Text("(おにたま)", style: TextStyle(color: Colors.white, fontSize: 20)),
            OnitamaWidget()
          ],
        )),
      ),
    );
  }
}
