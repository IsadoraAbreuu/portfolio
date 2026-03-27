import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class Experiencia extends StatelessWidget {
  String ano;
  String titulo;
  String descricao;

  Experiencia({super.key, required this.ano, required this.titulo, required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [escuro, const Color.fromARGB(255, 122, 13, 55)])),
              alignment: Alignment.center,
              child: Text(ano, style: TextStyle(color: texto, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
              ),  
            ),
          ],
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.8), borderRadius: BorderRadius.circular(20), border: Border.all(color: primaria.withOpacity(0.4))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: TextStyle( color: texto, fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Poppins")),
                SizedBox(height: 10),
                Text(descricao, style: TextStyle(color: Colors.white70, fontFamily: "Poppins"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}