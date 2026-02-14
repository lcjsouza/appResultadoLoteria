import 'package:resultado_loteria/utils/format_real.dart';
import 'package:flutter/material.dart';

/// Exibe a tabela de premiação de um concurso.
class PremiacaoWidget extends StatelessWidget {
  final Color cor;
  final List<Map<String, dynamic>> premiacao;

  const PremiacaoWidget({
    super.key,
    required this.cor,
    required this.premiacao,
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
              'Premiação',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 24),
            ...premiacao.map((premio) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    Text(
                      '${premio['descricaoFaixa']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      '${premio['numeroDeGanhadores']} ganhador - ${formatNumero(premio['valorPremio'])}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
