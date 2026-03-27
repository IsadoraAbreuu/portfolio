import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class StackChip extends StatelessWidget {
  String titulo;

  StackChip({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        border: Border.all(color: primaria, width: 1.5)),
      child: Text(titulo, style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w500)),
    );
  }
}