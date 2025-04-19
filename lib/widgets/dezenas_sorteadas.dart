import 'package:resultado_loteria/widgets/template%20sorteio/duplasena_sorteio.dart';
import 'package:resultado_loteria/widgets/template%20sorteio/federal_sorteio.dart';
import 'package:resultado_loteria/widgets/template%20sorteio/loteca_sorteio.dart';
import 'package:resultado_loteria/widgets/template%20sorteio/maismilionaria_sorteio.dart';
import 'package:resultado_loteria/widgets/template%20sorteio/outros_sorteios.dart';
import 'package:flutter/material.dart';

class DezenasSorteadasWidget extends StatefulWidget {
  final String jogo;
  final Color cor;
  final Color textColor;
  final List<String> numeros;
  final List<String>? sorteioDois;
  final List<String>? trevosSorteados;
  final double? espacoEntreDezenas;
  
  const DezenasSorteadasWidget(
    {
      super.key, 
      required this.jogo,
      required this.cor, 
      required this.textColor, 
      required this.numeros, 
      this.sorteioDois, 
      this.trevosSorteados, 
      this.espacoEntreDezenas, 
    }
  );

  @override
  State<DezenasSorteadasWidget> createState() => _DezenasSorteadasWidgetState();
}

class _DezenasSorteadasWidgetState extends State<DezenasSorteadasWidget> {
  @override
  Widget build(BuildContext context) {
    Widget childWidget;

    switch (widget.jogo) {
      case 'duplasena':
        childWidget = DuplaSenaSorteio(
          cor: widget.cor,
          textColor: widget.textColor,
          numeros: widget.numeros,
          sorteioDois: widget.sorteioDois,
          espacoEntreDezenas: widget.espacoEntreDezenas,
        );
        break;
      case 'maismilionaria':
        childWidget = MaisMilionariaSorteio(
          cor: widget.cor,
          textColor: widget.textColor,
          numeros: widget.numeros,
          trevosSorteados: widget.trevosSorteados ?? [],
          espacoEntreDezenas: widget.espacoEntreDezenas,
        );
        break;
      // case 'federal':
      //   childWidget = FederalSorteio(
      //     // cor: widget.cor,
      //     // textColor: widget.textColor,
      //     // numeros: widget.numeros,
      //     // trevosSorteados: widget.trevosSorteados ?? [],
      //     // espacoEntreDezenas: widget.espacoEntreDezenas,
      //   );
      //   break;
      // case 'loteca':
      //   childWidget = LotecaSorteio(
      //     // cor: widget.cor,
      //     // textColor: widget.textColor,
      //     // numeros: widget.numeros,
      //     // trevosSorteados: widget.trevosSorteados ?? [],
      //     // espacoEntreDezenas: widget.espacoEntreDezenas,
      //   );
      //   break;
      default:
        childWidget = OutrosSorteios(
          cor: widget.cor,
          textColor: widget.textColor,
          numeros: widget.numeros,
          espacoEntreDezenas: widget.espacoEntreDezenas,
        );
        break;
    }

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: widget.cor, width: 2)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: childWidget,
      ),
    );
  }
}
