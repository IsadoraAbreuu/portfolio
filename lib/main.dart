import 'package:flutter/material.dart';
import 'package:portfolio/screens/splash_screen.dart';

//------- variaveis de cores --------
Color background = const Color.fromARGB(255, 0, 0, 0);
Color primaria = const Color.fromARGB(255, 214, 46, 98);
Color secundaria = Color.fromARGB(255, 159, 28, 68);
Color escuro = const Color.fromARGB(255, 177, 4, 99);
Color texto = Colors.white;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
