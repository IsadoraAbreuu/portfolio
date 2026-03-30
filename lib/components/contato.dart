import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Contato extends StatelessWidget {

  Future<void> abrirLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir $url';
    }
  }
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: primaria.withOpacity(0.5)), color: Colors.black.withOpacity(0.8),
          boxShadow: [
            BoxShadow(color: primaria.withOpacity(0.3), blurRadius: 20, spreadRadius: 1),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Redes Sociais", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                socialIcon(FontAwesomeIcons.instagram, "https://www.instagram.com/isadora.abreuu/"),      
                socialIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/isadora-abreu-718359348/"),      
                socialIcon(FontAwesomeIcons.github, "https://github.com/IsadoraAbreuu"),      
                socialIcon(FontAwesomeIcons.envelope, "https://mail.google.com/mail/u/0/#inbox"),      
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => abrirLink(url),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: primaria)),
        child: Icon(icon, color: primaria, size: 22),
      )
    );
  }
}