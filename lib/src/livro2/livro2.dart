import 'package:flutter/material.dart';

class Livro {
  final String nome;
  final String imagem;

  Livro({required this.nome, required this.imagem});
}

class LivroCard extends StatelessWidget {
  final Livro livro;
  final Function onTap;

  LivroCard({required this.livro, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                livro.imagem,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                livro.nome,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetalhesLivroPage extends StatelessWidget {
  final Livro livro;

  DetalhesLivroPage({required this.livro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(livro.nome),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                livro.imagem,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                livro.nome,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(),
              TabBar(
                tabs: [
                  Tab(text: "Sobre o Livro"),
                  Tab(text: "Mais Detalhes"),
                ],
              ),
              TabBarView(
                children: [
                  // Conteúdo da guia "Sobre o Livro"
                  Column(
                    children: [
                      Text(
                        "Descrição do livro aqui...",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  // Conteúdo da guia "Mais Detalhes"
                  Column(
                    children: [
                      Text(
                        "Subtítulo do autor aqui...",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Livro> livros = [
    Livro(nome: "Livro 1", imagem: "assets/Empreendendor.jpeg"),
    Livro(nome: "Livro 2", imagem: "assets/Empreendendorismo.webp"),
    // Adicione mais livros conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Biblioteca",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: livros.length,
          itemBuilder: (context, index) {
            return LivroCard(
              livro: livros[index],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetalhesLivroPage(livro: livros[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
