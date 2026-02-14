import 'package:flutter/material.dart';

/// Template padrão de dezenas sorteadas (uma grade única de bolinhas).
class OutrosSorteios extends StatelessWidget {
  final Color cor;
  final Color textColor;
  final List<String> numeros;
  final double? espacoEntreDezenas;

  const OutrosSorteios({
    super.key,
    required this.cor,
    required this.textColor,
    required this.numeros,
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
        Wrap(
          spacing: espacoEntreDezenas ?? 8,
          runSpacing: 8,
          children: numeros
              .map((n) => _Bolinha(numero: n, cor: cor, textColor: textColor))
              .toList(),
        ),
      ],
    );
  }
}

class _Bolinha extends StatelessWidget {
  final String numero;
  final Color cor;
  final Color textColor;

  const _Bolinha({
    required this.numero,
    required this.cor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, color: cor),
      alignment: Alignment.center,
      child: Text(
        numero,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          color: textColor,
        ),
      ),
    );
  }
}
