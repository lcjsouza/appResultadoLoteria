import 'package:app_resultado_loteria/view/home/jogos_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/imagens/loteria-bg.png',
              fit: BoxFit.cover
            )
          ),
          Container(color: Colors.white.withOpacity(0.3)),
          JogosWidget()
        ],
      ),
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Resultado Loteria Federal'),
    //     ),
    //     body: Container(
    //       child: Image.asset('assets/imagens/loteria-bg.png'),
    //     ),
    //   ),
    // );
  }
}