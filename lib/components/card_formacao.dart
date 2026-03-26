import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class CardInfo extends StatelessWidget {
  String titulo;
  String subtitulo;

  CardInfo({super.key, required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.8), borderRadius: BorderRadius.circular(10), border: Border.all(color: primaria.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(color: secundaria.withOpacity(0.4), blurRadius: 10)
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: TextStyle( color: texto, fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Poppins")),
              Text( subtitulo, style: TextStyle(color: Colors.white70, fontSize: 10, fontFamily: "Poppins"),),
            ],
          )
        ],
      ),
    );
  }
}