import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class FormComponente extends StatelessWidget {
  FormComponente({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email", style: TextStyle( color: texto, fontFamily: "Poppins", fontSize: 14)),
          SizedBox(height: 8),

          Container(
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: primaria),
              boxShadow: [
                BoxShadow(color: primaria.withOpacity(0.5), blurRadius: 10)
              ],
            ),
          ),

          SizedBox(height: 20),
          Text("Mensagem", style: TextStyle(color: texto, fontFamily: "Poppins", fontSize: 14)),
          SizedBox(height: 8),

          Container(
            height: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: primaria),
              boxShadow: [
                BoxShadow(color: primaria.withOpacity(0.5), blurRadius: 10)
              ],
            ),
          ),

          SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), gradient: LinearGradient(colors: [primaria, secundaria])),
            child: Center(
              child: Text("Enviar mensagem", style: TextStyle(color: texto, fontFamily: "Poppins", fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}