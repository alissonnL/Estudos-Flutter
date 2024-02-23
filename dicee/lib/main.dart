import 'package:flutter/material.dart';
import 'Dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dicee(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dicee extends StatefulWidget {
  const Dicee({super.key});

  @override
  State<Dicee> createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  Dice dado = Dice();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DICEE",
          style: TextStyle(
            color: Colors.white,
          )
          ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        
      ),
      body: Center(
        heightFactor: 50,
        widthFactor: 50,
        child: InkWell(
          onTap: () => setState(() {
            dado.jogarDado();
          }),
          child: Image.asset('dice${dado.getNum()}.png'),
        )
      ),
      backgroundColor: Colors.black12,
    );
  }
}