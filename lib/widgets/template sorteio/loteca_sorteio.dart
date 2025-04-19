import 'package:flutter/material.dart';

class LotecaSorteio extends StatefulWidget {
  const LotecaSorteio({Key? key}) : super(key: key);

  @override
  _LotecaSorteioState createState() => _LotecaSorteioState();
}

class _LotecaSorteioState extends State<LotecaSorteio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loteca Sorteio'),
      ),
      body: Center(
        child: const Text('Conteúdo do Loteca Sorteio'),
      ),
    );
  }
}