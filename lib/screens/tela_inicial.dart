import 'package:flutter/material.dart';
import 'package:portfolio/components/card_formacao.dart';
import 'package:video_player/video_player.dart';
import 'package:portfolio/main.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  late VideoPlayerController _controller;

  final sobreKey = GlobalKey();
  final projetosKey = GlobalKey();
  final contatoKey = GlobalKey();

  void scroll(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller =
        VideoPlayerController.asset('asset/videos/video-background.mp4')
          ..setLooping(true)
          ..setVolume(0)
          ..initialize().then((_) {
            _controller.play();
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: () => scroll(sobreKey),
            child: Text("Sobre", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w300))),
          TextButton(onPressed: () => scroll(projetosKey),
            child: Text("Tecnologias", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w300))),
          TextButton(onPressed: () => scroll(contatoKey),
            child: Text("Contato", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w300))),
          TextButton(onPressed: () => scroll(contatoKey), 
            child: Text("Projetos", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w300))), //leva para outra pagina
        ],
      ),

      body: Stack(
        children: [
          // video de background
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),

          // overlay para o video ficar mais escuro
          Container(
            color: Colors.black.withOpacity(0.6),
          ),

          SingleChildScrollView( //scroll separado em seções
          //sobre
            child: Column(
              children: [
                Container(
                  key: sobreKey,
                  height: 300,
                  padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Isadora Lucchesi", style: TextStyle(color: primaria, fontSize: 14, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Desenvolvedora\nFullStack", style: TextStyle(color: texto, fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "Poppins")),
                          SizedBox(height: 10),
                          Text("Apaixonada por criar soluções \ndigitais eficientes e dar \nvida a ideias com código, \nsempre com foco em inovação.", style: TextStyle(color: Colors.white70, fontFamily: "Poppins")),
                        ],
                      ),

                      Container(
                      width: 200,
                      height: 200,
                      decoration:
                       BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        image: DecorationImage(
                          image: AssetImage('asset/images/foto-bolinha.png'), 
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(color: secundaria.withOpacity(0.6), blurRadius: 100, spreadRadius: 1)
                        ]
                      ),
                      ),
                    ],
                  ),
                ),

                // formações
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CardInfo(
                          titulo: 'Técnico em \nMecatrônica',
                          subtitulo: 'SENAI Roberto Mange',
                        ),
                        SizedBox(width: 20),
                        CardInfo(
                          titulo: 'Técnico em \nDesenv. Sistemas',
                          subtitulo: 'SENAI Roberto Mange',
                        ),
                        SizedBox(width: 20),
                        CardInfo(
                          titulo: 'Engenharia de \nSoftware',
                          subtitulo: 'Unimetrocamp Wyden',
                        ),
                      ]
                    ),
                  ],
                ),

                // tecnologias
                Container(
                  key: projetosKey,
                  height: 600,
                  alignment: Alignment.center,
                  child: Text("Tecnologias", style: TextStyle(color: texto, fontSize: 24)),
                ),

                // contato
                Container(
                  key: contatoKey,
                  height: 600,
                  alignment: Alignment.center,
                  child: Text("Contato", style: TextStyle(color: texto, fontSize: 24)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}