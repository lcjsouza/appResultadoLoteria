import 'package:resultado_loteria/utils/format_real.dart';
import 'package:flutter/material.dart';

/// Exibe as informações gerais de um concurso (arrecadação, acumulado, próximo).
class InformacoesConcursoWidget extends StatelessWidget {
  final Color cor;
  final String municipioVencedor;
  final double valorArrecadado;
  final double valorAcumulado;
  final double valorAcumuladoConcursoEspecial;
  final int proximoConcurso;
  final String dataProximoConcurso;
  final double estimativaPremio;

  const InformacoesConcursoWidget({
    super.key,
    required this.cor,
    required this.municipioVencedor,
    required this.valorArrecadado,
    required this.valorAcumulado,
    required this.valorAcumuladoConcursoEspecial,
    required this.proximoConcurso,
    required this.dataProximoConcurso,
    required this.estimativaPremio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: cor, width: 2),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              'Informações do Concurso',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 24),
            _InfoItem(label: 'Município vencedor', valor: municipioVencedor),
            const SizedBox(height: 12),
            _InfoItem(
              label: 'Arrecadação total',
              valor: formatNumero(valorArrecadado),
            ),
            const SizedBox(height: 12),
            _InfoItem(
              label: 'Acumulado para sorteio especial',
              valor: formatNumero(valorAcumuladoConcursoEspecial),
            ),
            const SizedBox(height: 48),
            const Text(
              'Próximo concurso',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 24),
            _InfoItem(label: 'Número', valor: '$proximoConcurso'),
            const SizedBox(height: 12),
            _InfoItem(label: 'Data', valor: dataProximoConcurso),
            const SizedBox(height: 12),
            _InfoItem(
              label: 'Estimativa de prêmio',
              valor: formatNumero(estimativaPremio),
            ),
          ],
        ),
      ),
    );
  }
}

/// Par label + valor reutilizado dentro de InformacoesConcursoWidget.
class _InfoItem extends StatelessWidget {
  final String label;
  final String valor;

  const _InfoItem({required this.label, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        Text(
          valor,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
