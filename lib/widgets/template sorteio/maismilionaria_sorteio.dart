import 'package:flutter/material.dart';

class MaisMilionariaSorteio extends StatefulWidget {
  final Color cor;
  final Color textColor;
  final List<String> numeros;
  final List<String> trevosSorteados;
  final double? espacoEntreDezenas;

  const MaisMilionariaSorteio(
      {super.key,
      required this.cor,
      required this.textColor,
      required this.numeros,
      required this.trevosSorteados,
      this.espacoEntreDezenas});

  @override
  State<MaisMilionariaSorteio> createState() => _MaisMilionariaSorteioState();
}

class _MaisMilionariaSorteioState extends State<MaisMilionariaSorteio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dezenas Sorteadas',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
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
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: widget.cor),
                alignment: Alignment.center,
                child: Text(
                  '$numero',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: widget.textColor),
                ));
          }).toList(),
        ),
        const SizedBox(height: 30),
        // Trevos sorteados
        Text(
          'Trevos Sorteados',
          style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
        SizedBox(height: 24),
        Wrap(
          spacing: widget.espacoEntreDezenas ?? 8,
          runSpacing: 8,
          children: widget.trevosSorteados.map((numero) {
            return Container(
                width: 40,
                height: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: widget.cor),
                alignment: Alignment.center,
                child: Text(
                  '$numero',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: widget.textColor),
                ));
          }).toList(),
        ),
      ],
    );
  }
}
