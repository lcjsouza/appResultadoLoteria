import 'package:flutter/material.dart';

/// Template de dezenas para a Dupla Sena (exibe dois sorteios separados).
class DuplaSenaSorteio extends StatelessWidget {
  final Color cor;
  final Color textColor;
  final List<String> numeros;
  final List<String>? sorteioDois;
  final double? espacoEntreDezenas;

  const DuplaSenaSorteio({
    super.key,
    required this.cor,
    required this.textColor,
    required this.numeros,
    this.sorteioDois,
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
        const Text(
          '1º Sorteio',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _GradeDezenas(
          numeros: numeros,
          cor: cor,
          textColor: textColor,
          espacoEntreDezenas: espacoEntreDezenas,
        ),
        const SizedBox(height: 24),
        const Text(
          '2º Sorteio',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _GradeDezenas(
          numeros: sorteioDois ?? [],
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
