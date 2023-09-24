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
