import 'package:flutter/material.dart';
import 'src/livro/livro.dart';
import 'src/livro/detalhes_livro.dart';

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
  Livro(nome: "Emoreendendor", imagem: "assets/Empreendendor.jpeg"),
  Livro(nome: "Empreendimento", imagem: "assets/Empreendendorismo.webp"),
  Livro(nome: "O manual", imagem: "assets/ManualParaSonhadores.webp"),
  Livro(nome: "Mente empreendendor", imagem: "assets/MenteEmpreendedor.jpeg"),
  Livro(nome: "Os segredos...", imagem: "assets/menteMilionaria.jpeg"),
  Livro(nome: "Mindset", imagem: "assets/mindset.jpeg"),
  Livro(nome: "Conciente", imagem: "assets/consciente.jpeg"),
  Livro(nome: "Dobre seus lucros", imagem: "assets/doresLucro.jpeg"),
  Livro(nome: "Pai rico pai pobre", imagem: "assets/pairicopaipobre.jpeg"),
  Livro(nome: "Atitude...", imagem: "assets/atitudeEmpreendedora.webp"),
  Livro(nome: "Habito", imagem: "assets/habito.jpeg"),
  Livro(nome: "Poder e ação", imagem: "assets/poderAcao.jpeg"),
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
