import 'package:app_resultado_loteria/utils/format_real.dart';
import 'package:flutter/material.dart';

class PremiacaoWidget extends StatefulWidget {
  final Color cor;
  final List<Map<String, dynamic>> premiacao;

  const PremiacaoWidget({super.key, required this.cor, required this.premiacao});

  @override
  State<PremiacaoWidget> createState() => _PremiacaoWidgetState();
}

class _PremiacaoWidgetState extends State<PremiacaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: widget.cor, width: 2)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Premiação',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            SizedBox(height: 24),
            ...widget.premiacao.map((premio) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    Text(
                      '${premio['descricaoFaixa']}', 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      '${premio['numeroDeGanhadores']} ganhador - ${formatNumero(premio['valorPremio'])}', 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}