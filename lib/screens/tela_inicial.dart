import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Portfolio", style: TextStyle(color: texto)), backgroundColor: background,),
      body: Center(
        child: Column(
          children: [
            Text("salve aqui e a isadora e to mandando aqui para geral")
          ],
        ),
      ),
    );
  }
}