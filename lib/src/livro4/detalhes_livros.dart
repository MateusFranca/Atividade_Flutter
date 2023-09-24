import 'package:flutter/material.dart';
import 'livro4.dart';

class DetalhesLivroPage extends StatefulWidget {
  final Livro livro;

  DetalhesLivroPage({required this.livro});

  @override
  _DetalhesLivroPageState createState() => _DetalhesLivroPageState();
}

class _DetalhesLivroPageState extends State<DetalhesLivroPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.livro.nome),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Sobre o Livro"),
            Tab(text: "Mais Detalhes"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Conteúdo da guia "Sobre o Livro"
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.livro.imagem,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.livro.nome,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Divider(), // Separador
                  Text(
                    "Sobre o Livro",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Descrição do livro aqui...",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          // Conteúdo da guia "Mais Detalhes"
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mais detalhes sobre o livro aqui...",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
