import 'package:flutter/material.dart';
import 'livro.dart';

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
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non urna nec elit volutpat sagittis. Sed auctor justo eget felis lacinia, eu vehicula velit hendrerit. Nullam auctor metus eget libero imperdiet, sed ullamcorper mi volutpat. Cras interdum arcu in quam tincidunt, ut vehicula purus malesuada.",
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
