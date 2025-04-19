import 'package:resultado_loteria/view/home/jogos_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/imagens/loteria-bg.png',
              fit: BoxFit.cover, // Garante que a imagem cubra toda a tela
            ),
          ),
          Container(color: Colors.white.withOpacity(0.3)),
          JogosWidget()
        ],
      ),
    );
  }
}