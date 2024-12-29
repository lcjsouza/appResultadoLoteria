import 'package:flutter/material.dart';

class DezenasSorteadasWidget extends StatefulWidget {
  final Color cor;
  final List<String> numeros;
  
  const DezenasSorteadasWidget({super.key, required this.cor, required this.numeros});

  @override
  State<DezenasSorteadasWidget> createState() => _DezenasSorteadasWidgetState();
}

class _DezenasSorteadasWidgetState extends State<DezenasSorteadasWidget> {

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
              'Dezenas Sorteadas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.numeros.map((numero) {
              return Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.cor
                ),
                alignment: Alignment.center,
                child: Text(
                  '$numero',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Colors.white
                  ),
                )
              );
            }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
