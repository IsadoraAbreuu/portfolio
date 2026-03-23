import 'package:flutter/material.dart';
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

    _controller = VideoPlayerController.asset(
      'asset/videos/video-background.mp4',
    )
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Portfolio", style: TextStyle(color: texto)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => scroll(sobreKey),
            child: const Text("Sobre", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scroll(projetosKey),
            child: const Text("Projetos", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scroll(contatoKey),
            child: const Text("Contato", style: TextStyle(color: Colors.white)),
          ),
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

          // overlay para deixar o video mais escuro
          Container(
            color: Colors.black.withOpacity(0.7),
          ),

          SingleChildScrollView( // scroll por seção
            child: Column(
              children: [
                Container(
                  key: sobreKey,
                  height: 600,
                  alignment: Alignment.center,
                  child: const Text(
                    "Sobre",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),

                Container(
                  key: projetosKey,
                  height: 600,
                  alignment: Alignment.center,
                  child: const Text(
                    "Projetos",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),

                Container(
                  key: contatoKey,
                  height: 600,
                  alignment: Alignment.center,
                  child: const Text(
                    "Contato",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}