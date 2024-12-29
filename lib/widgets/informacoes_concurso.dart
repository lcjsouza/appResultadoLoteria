import 'package:app_resultado_loteria/utils/format_real.dart';
import 'package:flutter/material.dart';

class InformacoesConcursoWidget extends StatefulWidget {
  final Color cor;
  final String municipioVencedor;
  final double valorArrecadado;
  final double valorAcumulado;
  final double valorAcumuladoConcursoEspecial;
  final int proximoConcurso;
  final String dataProximoConcurso;
  final double estimativaPremio;
  const InformacoesConcursoWidget({super.key, required this.cor, required this.municipioVencedor, required this.valorArrecadado, required this.valorAcumulado, required this.proximoConcurso, required this.dataProximoConcurso, required this.estimativaPremio, required this.valorAcumuladoConcursoEspecial});

  @override
  State<InformacoesConcursoWidget> createState() => _InformacoesConcursoWidgetState();
}

class _InformacoesConcursoWidgetState extends State<InformacoesConcursoWidget> {
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
              'Informações do Concurso',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            SizedBox(height: 24),
            // Municipio
            Text(
              'Município vencedor', 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              widget.municipioVencedor, 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 12),
            // Arrecadação total
            Text(
              'Arrecadação total', 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              formatNumero(widget.valorArrecadado),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 12),
            // Acumulado
            Text(
              'Acumulado para sorteio especial', 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              formatNumero(widget.valorAcumuladoConcursoEspecial),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 48),
            Text(
              'Próximo concurso', 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 24),
            // Número
            Text(
              'Número', 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              '${widget.proximoConcurso}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 12),
            // Data
            Text(
              'Data', 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              widget.dataProximoConcurso,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 12),
            // Estimativa
            Text(
              'Estimativa de prêmio', 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              formatNumero(widget.estimativaPremio),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

