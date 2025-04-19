import 'package:flutter/material.dart';

class OutrosSorteios extends StatefulWidget {
  final Color cor;
  final Color textColor;
  final List<String> numeros;
  final List<String>? sorteioDois;
  final double? espacoEntreDezenas;

  const OutrosSorteios({super.key, required this.cor, required this.textColor, required this.numeros, this.sorteioDois, this.espacoEntreDezenas});

  @override
  State<OutrosSorteios> createState() => _OutrosSorteiosState();
}

class _OutrosSorteiosState extends State<OutrosSorteios> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dezenas Sorteadas',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'
          ),
        ),
        SizedBox(height: 24),
        // Números sorteados
        Wrap(
          spacing: widget.espacoEntreDezenas ?? 8,
          runSpacing: 8,
          children: widget.numeros.map((numero) {
          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.cor
            ),
            alignment: Alignment.center,
            child: Text(
              '$numero',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: widget.textColor
              ),
            )
          );
        }).toList(),
        ),
      ],
    );
  }
}