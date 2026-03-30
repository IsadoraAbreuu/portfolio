import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/main.dart';

class ProjetoCard extends StatefulWidget {
  String titulo;
  String descricao;
  String imagem;
  String? link; //n é obrigatorio

  ProjetoCard({super.key, required this.titulo, required this.descricao, required this.imagem, this.link});

  @override
  State<ProjetoCard> createState() => _ProjetoCardState();
}

class _ProjetoCardState extends State<ProjetoCard> {
  int avaliacao = 0; // quantidade de estrelas de avaliaçao

  Future<void> abrirLink(String url) async {
    Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(margin:EdgeInsets.only(top: 60), padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
          decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(25), border: Border.all(color: primaria.withOpacity(0.8)),
            boxShadow: [
              BoxShadow(color: secundaria.withOpacity(0.6), blurRadius: 10)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: texto, fontFamily: "Poppins")),

              SizedBox(height: 10),
              Text(widget.descricao, style: TextStyle(fontSize: 14, color: texto, fontFamily: "Poppins")),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: List.generate(5, (index) {
                      return IconButton(onPressed: () {
                          setState(() {
                            avaliacao = index + 1;
                          });
                        },
                        icon: Icon(FontAwesomeIcons.star, size: 20,
                          color: index < avaliacao
                              ? Colors.orange
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
             
                  TextButton(style: ElevatedButton.styleFrom(backgroundColor: primaria, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    onPressed: () => abrirLink(widget.link!),
                    child: Text("Detalhes", style: TextStyle(color: texto, fontFamily: "Poppins")),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(top: 0, child: Image.asset(widget.imagem, width: 260)),
      ],
    );
  }
}