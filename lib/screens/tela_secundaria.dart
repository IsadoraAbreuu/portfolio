import 'package:flutter/material.dart';
import 'package:portfolio/components/projeto-card.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/screens/tela_inicial.dart';

class TelaSecundaria extends StatelessWidget {
  const TelaSecundaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar( //nav bar
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()));}, child: Text("Sobre", style: TextStyle(color: texto,fontFamily: "Poppins"))),
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()));}, child: Text("Tecnologias", style: TextStyle(color:texto, fontFamily: "Poppins"))),
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()));}, child: Text("Contato", style: TextStyle(color: texto, fontFamily: "Poppins"))),
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TelaSecundaria()));
          },
          child: Text("Projetos", style: TextStyle(color: texto, fontFamily: "Poppins"))), //muda para a pagina de projetos
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text("Projetos", style: TextStyle(color: texto, fontFamily: "Poppins", fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Explore um pouco dos meus projetos.", style: TextStyle(color: Colors.white70, fontFamily: "Poppins")),
            SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  SizedBox(width: 370, child: 
                  ProjetoCard(
                    titulo: "DLOGIC",
                    descricao: "Automação para o cálculo de displays.",
                    imagem: "asset/images/dlogic.png",
                    link: "https://github.com/EnzoPrevitale/projeto_hackathon",
                  )),
                  SizedBox(height: 20),
                  SizedBox(width: 370, child: 
                  ProjetoCard(
                    titulo: "FilHub",
                    descricao: "Plataforma de gerenciamento de filmes.",
                    imagem: "asset/images/filhub.png",
                    link: "https://github.com/IsadoraAbreuu/FilHub",
                  )),
                  SizedBox(height: 20),
                  SizedBox(width: 370, child: 
                  ProjetoCard(
                    titulo: "MoniDora",
                    descricao: "Gerenciamento de sensores, locais e responsáveis.",
                    imagem: "asset/images/monidora.png",
                    link: "https://github.com/IsadoraAbreuu/MoniDora",
                  )),
                  SizedBox(height: 20),
                  SizedBox(width: 370, child: 
                  ProjetoCard(
                    titulo: "REMAP",
                    descricao: "Plataforma de gerenciamento de recursos e projetos.",
                    imagem: "asset/images/dlogic.png",
                    link: "https://github.com/EnzoPrevitale/projeto_hackathon",
                  )),
                  SizedBox(height: 20),
                  SizedBox(width: 370, child: 
                  ProjetoCard(
                    titulo: "FeedForword",
                    descricao: "Plataforma central de feedbacks dos aprendizes.",
                    imagem: "asset/images/feedforword.png",
                    link: "https://github.com/EnzoPrevitale/projeto_hackathon",
                  )),
                  SizedBox(height: 20),
                  SizedBox(width: 370, child: 
                  ProjetoCard(
                    titulo: "To Do List",
                    descricao: "To Do List para gerenciar suas tarefas diárias.",
                    imagem: "asset/images/to-do-list.png",
                    link: "https://github.com/IsadoraAbreuu/To-Do_list",
                  )),
                ],
              ),
            ),
          ] 
        ),
      )
      
    );
  }
}