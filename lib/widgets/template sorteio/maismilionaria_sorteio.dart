import 'package:flutter/material.dart';

/// Template de dezenas para a +Milionária (dezenas + trevos sorteados).
class MaisMilionariaSorteio extends StatelessWidget {
  final Color cor;
  final Color textColor;
  final List<String> numeros;
  final List<String> trevosSorteados;
  final double? espacoEntreDezenas;

  const MaisMilionariaSorteio({
    super.key,
    required this.cor,
    required this.textColor,
    required this.numeros,
    required this.trevosSorteados,
    this.espacoEntreDezenas,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Dezenas Sorteadas',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 24),
        _GradeDezenas(
          numeros: numeros,
          cor: cor,
          textColor: textColor,
          espacoEntreDezenas: espacoEntreDezenas,
        ),
        const SizedBox(height: 30),
        const Text(
          'Trevos Sorteados',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 24),
        _GradeDezenas(
          numeros: trevosSorteados,
          cor: cor,
          textColor: textColor,
          espacoEntreDezenas: espacoEntreDezenas,
        ),
      ],
    );
  }
}

class _GradeDezenas extends StatelessWidget {
  final List<String> numeros;
  final Color cor;
  final Color textColor;
  final double? espacoEntreDezenas;

  const _GradeDezenas({
    required this.numeros,
    required this.cor,
    required this.textColor,
    this.espacoEntreDezenas,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: espacoEntreDezenas ?? 8,
      runSpacing: 8,
      children: numeros.map((n) {
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(shape: BoxShape.circle, color: cor),
          alignment: Alignment.center,
          child: Text(
            n,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: textColor,
            ),
          ),
        );
      }).toList(),
    );
  }
}
