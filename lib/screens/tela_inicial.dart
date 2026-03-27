import 'package:flutter/material.dart';
import 'package:portfolio/components/experiencia.dart';
import 'package:portfolio/components/form.dart';
import 'package:portfolio/components/stack.dart';
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
      appBar: AppBar( //nav bar
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: () => scroll(sobreKey), child: const Text("Sobre", style: TextStyle(color: Colors.white,fontFamily: "Poppins"))),
          TextButton( onPressed: () => scroll(projetosKey), child: const Text("Tecnologias", style: TextStyle(color: Colors.white, fontFamily: "Poppins"))),
          TextButton(onPressed: () => scroll(contatoKey), child: const Text("Contato", style: TextStyle(color: Colors.white, fontFamily: "Poppins"))),
          TextButton(onPressed: () => scroll(contatoKey), child: const Text("Projetos", style: TextStyle(color: Colors.white, fontFamily: "Poppins"))), //muda para a pagina de projetos
        ],
      ),

      body: Stack(
        children: [
          // video de background 
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(width: _controller.value.size.width, height: _controller.value.size.height, child: VideoPlayer(_controller)),
              ),
            ),

          // overlay para o video ficar mais escuro
          Container(color: background.withOpacity(0.6)),

          SingleChildScrollView( // scroll por seção
          // sobre
            child: Column(
              children: [
                Container(
                  key: sobreKey,
                  height: 300,
                  padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Isadora Lucchesi", style: TextStyle( color: primaria, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Poppins")),
                          SizedBox(height: 10),
                          Text("Desenvolvedora\nFullStack", style: TextStyle( color: texto, fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "Poppins")),
                          SizedBox(height: 10),
                          Text("Apaixonada por criar soluções digitais\ne dar vida a ideias com código.", style: TextStyle(color: Colors.white70, fontFamily: "Poppins")),
                        ],
                      ),

                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('asset/images/foto-bolinha.png'), fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: secundaria.withOpacity(0.6),
                              blurRadius: 100,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // experiencia
                SizedBox(height: 60),
                Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Experiência", style: TextStyle(color: texto, fontSize: 22, fontWeight: FontWeight.w600, fontFamily: "Poppins"))),
                ),
                SizedBox(height: 25),
                Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Experiencia(ano: "2025", titulo: "Bacharelado em Engenharia de Software", descricao: "Unimetrocamp Wyden"),
                      SizedBox(height: 30),
                      Experiencia(ano: "2025", titulo: "Técnico em Desenvolvimento de Sistemas", descricao: "Escola e Faculdade de Tecnologia Roberto Mange"),
                      SizedBox(height: 30),
                      Experiencia(ano: "2023", titulo: "Técnico em Mecatrônica", descricao: "Escola e Faculdade de Tecnologia Roberto Mange"),
                    ],
                  ),
                ),

                SizedBox(height: 100),

                // tecnologias
                Container(
                  key: projetosKey,
                  height: 220,
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tecnologias", style: TextStyle(color: texto, fontSize: 22, fontWeight: FontWeight.w600, fontFamily: "Poppins")),
                        SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StackChip(titulo: "React"),
                            SizedBox(width: 10),
                            StackChip(titulo: "Angular"),
                            SizedBox(width: 10),
                            StackChip(titulo: "HTML"),
                            SizedBox(width: 10),
                            StackChip(titulo: "JS"),
                            SizedBox(width: 10),
                            StackChip(titulo: "Python"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StackChip(titulo: "Java"),
                            SizedBox(width: 10),
                            StackChip(titulo: "CSS"),
                            SizedBox(width: 10),
                            StackChip(titulo: "Tailwind"),
                            SizedBox(width: 10),
                            StackChip(titulo: "Django"),
                            SizedBox(width: 10),
                            StackChip(titulo: "Figma"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StackChip(titulo: "Canva"),
                            SizedBox(width: 10),
                            StackChip(titulo: "NextJS"),
                            SizedBox(width: 10),
                            StackChip(titulo: "TypeScript"),
                            SizedBox(width: 10),
                            StackChip(titulo: "FastAPI"),
                          ],
                        )
                      ],
                    )
                  )
                ),

                SizedBox(height: 100),

                // contato
                Container(
                  key: contatoKey,
                  height: 600,
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Contato", style: TextStyle(color: texto, fontSize: 22, fontWeight: FontWeight.w600, fontFamily: "Poppins")),
                        Text("Para contato, entre em contato pelo forms abaixo.", style: TextStyle(color: Colors.white70, fontFamily: "Poppins")),
                        FormComponente(),
                    ],
                  ) 
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}