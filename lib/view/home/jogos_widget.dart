import 'package:flutter/material.dart';

class JogosWidget extends StatefulWidget {
  const JogosWidget({super.key});
  @override
  State<JogosWidget> createState() => _JogosWidgetState();
}

class _JogosWidgetState extends State<JogosWidget> { 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, top: 0, right: 50, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BotaoHome(texto: 'Lotofácil', cor: Colors.deepPurple, jogo: 'lotofacil'),
            Container(height: 30),
            BotaoHome(texto: 'Lotomania', cor: Color(0xFFE64A19), jogo: 'lotomania'),
            Container(height: 30),
            BotaoHome(texto: 'Quina', cor: Color(0xFF1A237E), jogo: 'quina'),
            Container(height: 30),
            BotaoHome(texto: 'Mega Sena', cor: Color(0xFF558B2F), jogo: 'megasena'),
          ],
        ),
      ),
    );
  }
}

class BotaoHome extends StatefulWidget {
  final String texto;
  final Color cor;
  final String jogo;

  const BotaoHome({super.key, required this.texto, required this.cor, required this.jogo});
  @override
  State<BotaoHome> createState() => _BotaoHomeState();
}

class _BotaoHomeState extends State<BotaoHome> {
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        switch (widget.jogo) {
          case 'lotofacil':
            Navigator.of(context).pushNamed('/lotofacil');
            break;
          case 'lotomania':
            Navigator.of(context).pushNamed('/lotomania');
            break;
          case 'quina':
            Navigator.of(context).pushNamed('/quina');
            break;
          case 'megasena':
            Navigator.of(context).pushNamed('/megasena');
            break;
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: widget.cor
      ),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            widget.texto, 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'
            ),
          ),
        ),
      )
    );
  }
}

