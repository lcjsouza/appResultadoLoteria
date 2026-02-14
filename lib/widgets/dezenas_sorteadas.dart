import 'package:resultado_loteria/widgets/template%20sorteio/duplasena_sorteio.dart';
import 'package:resultado_loteria/widgets/template%20sorteio/maismilionaria_sorteio.dart';
import 'package:resultado_loteria/widgets/template%20sorteio/outros_sorteios.dart';
import 'package:flutter/material.dart';

/// Exibe as dezenas sorteadas usando o template correto para cada tipo de jogo.
class DezenasSorteadasWidget extends StatelessWidget {
  final String jogo;
  final Color cor;
  final Color textColor;
  final List<String> numeros;
  final List<String>? sorteioDois;
  final List<String>? trevosSorteados;
  final double? espacoEntreDezenas;

  const DezenasSorteadasWidget({
    super.key,
    required this.jogo,
    required this.cor,
    required this.textColor,
    required this.numeros,
    this.sorteioDois,
    this.trevosSorteados,
    this.espacoEntreDezenas,
  });

  @override
  Widget build(BuildContext context) {
    final Widget conteudo = switch (jogo) {
      'duplasena' => DuplaSenaSorteio(
          cor: cor,
          textColor: textColor,
          numeros: numeros,
          sorteioDois: sorteioDois,
          espacoEntreDezenas: espacoEntreDezenas,
        ),
      'maismilionaria' => MaisMilionariaSorteio(
          cor: cor,
          textColor: textColor,
          numeros: numeros,
          trevosSorteados: trevosSorteados ?? [],
          espacoEntreDezenas: espacoEntreDezenas,
        ),
      _ => OutrosSorteios(
          cor: cor,
          textColor: textColor,
          numeros: numeros,
          espacoEntreDezenas: espacoEntreDezenas,
        ),
    };

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: cor, width: 2),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: conteudo,
      ),
    );
  }
}
