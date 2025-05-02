import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[700]!, Colors.blue[400]!], // Gradiente azul
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Sombra leve
            blurRadius: 10, // Intensidade do desfoque
            offset: const Offset(0, 5), // Deslocamento da sombra
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent, // Fundo transparente para o gradiente
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Ação ao clicar na seta de retorno
          },
        ),
        title: const Text(
          'Voltar para home',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 18, // Ajuste do tamanho da fonte
            color: Colors.white,
          ),
        ),
        elevation: 0, // Remove a sombra padrão do AppBar
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}