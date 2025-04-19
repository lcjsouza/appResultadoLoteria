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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotaoHome(texto: 'Lotofácil', backgroundColor: Color(0xFF930089), textColor: Color(0xFFFFFFFF), jogo: 'lotofacil'),
                Container(height: 50),
                BotaoHome(texto: 'Lotomania', backgroundColor: Color(0xFFf78100), textColor: Color(0xFFFFFFFF), jogo: 'lotomania'),
                Container(height: 50),
                BotaoHome(texto: 'Quina', backgroundColor: Color(0xFF260085), textColor: Color(0xFFFFFFFF), jogo: 'quina'),
                Container(height: 50),
                BotaoHome(texto: 'Mega Sena', backgroundColor: Color(0xFF209869), textColor: Color(0xFFFFFFFF), jogo: 'megasena'),
                Container(height: 50),
                BotaoHome(texto: 'Timemania', backgroundColor: Color(0xFF00ff48), textColor: Color(0xFFFFFFFF), jogo: 'timemania'),
                Container(height: 50),
                BotaoHome(texto: 'Dupla Sena', backgroundColor: Color(0xFFa61324), textColor: Color(0xFFFFFFFF), jogo: 'duplasena'),
                Container(height: 50),
                BotaoHome(texto: 'Dia de Sorte', backgroundColor: Color(0xFFcb852b), textColor: Color(0xFFFFFFFF), jogo: 'diasorte'),
                Container(height: 50),
                BotaoHome(texto: 'Super Sete', backgroundColor: Color(0xFFa8cf45), textColor: Color(0xFFFFFFFF), jogo: 'supersete'),
                Container(height: 50),
                BotaoHome(texto: '+ Milionaria', backgroundColor: Color(0xFF2E3078), textColor: Color(0xFFFFFFFF), jogo: 'maismilionaria'),
                Container(height: 50),
                BotaoHome(texto: 'Federal', backgroundColor: Color(0xFF105099), textColor: Color(0xFFFFFFFF), jogo: 'federal'),
                Container(height: 50),
                BotaoHome(texto: 'Loteca', backgroundColor: Color(0xFFfb1f00), textColor: Color(0xFFFFFFFF), jogo: 'loteca'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BotaoHome extends StatefulWidget {
  final String texto;
  final Color backgroundColor;
  final Color textColor;
  final String jogo;

  const BotaoHome(
      {super.key,
      required this.texto,
      required this.backgroundColor,
      required this.textColor,
      required this.jogo});
  @override
  State<BotaoHome> createState() => _BotaoHomeState();
}

class _BotaoHomeState extends State<BotaoHome> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
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
            case 'timemania':
              Navigator.of(context).pushNamed('/timemania');
              break;
            case 'duplasena':
              Navigator.of(context).pushNamed('/duplasena');
              break;
            case 'federal':
              Navigator.of(context).pushNamed('/federal');
              break;
            case 'loteca':
              Navigator.of(context).pushNamed('/loteca');
              break;
            case 'diasorte':
              Navigator.of(context).pushNamed('/diasorte');
              break;
            case 'supersete':
              Navigator.of(context).pushNamed('/supersete');
              break;
            case 'maismilionaria':
              Navigator.of(context).pushNamed('/maismilionaria');
              break;
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.textColor,
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Remove o arredondamento
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              widget.texto,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
          ),
        ));
  }
}