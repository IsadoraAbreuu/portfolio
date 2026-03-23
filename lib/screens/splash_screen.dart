import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/screens/tela_inicial.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(width: 96, height: 96,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black, border: Border.all(color: primaria, width: 2),
                boxShadow: [
                  BoxShadow(color: secundaria,blurRadius: 36, spreadRadius: 4)
                ],
              ),
              child: Center(
                child: Text("</>", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: "Poppins")),
              ),
            ),

            SizedBox(height: 44),
            Container(
              width: 330,
              height: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                image: DecorationImage(
                  image: AssetImage('asset/images/foto.png'), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent,Colors.black.withOpacity(0.5),Colors.black.withOpacity(0.99)],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
            Text("Isadora Lucchesi", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 4, fontFamily: 'Poppins')),

            SizedBox(height: 8),
            ShaderMask(
              shaderCallback: (r) => const LinearGradient(
                colors: [Colors.white, Color.fromARGB(255, 197, 197, 197)],
              ).createShader(r),
              child: Text('software developer', style: TextStyle(fontSize: 14, color: Colors.white, letterSpacing: 2, fontWeight: FontWeight.w500, fontFamily: 'Poppins')),
            ),

            SizedBox(height: 16),
            TextButton(style: TextButton.styleFrom(
              backgroundColor: primaria.withOpacity(0.5),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => TelaInicial()));
           }, 
           child: Text("Entrar", style: TextStyle(color: texto, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Poppins')))
          ],
        ),
      ),
    );
  }
}