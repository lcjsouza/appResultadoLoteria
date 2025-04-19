import 'package:flutter/material.dart';

class FederalSorteio extends StatefulWidget {
  const FederalSorteio({Key? key}) : super(key: key);

  @override
  _FederalSorteioState createState() => _FederalSorteioState();
}

class _FederalSorteioState extends State<FederalSorteio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Federal Sorteio'),
      ),
      body: Center(
        child: const Text('Conteúdo do sorteio federal'),
      ),
    );
  }
}