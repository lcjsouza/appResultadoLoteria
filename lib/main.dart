import 'package:app_resultado_loteria/view/home/home_page.dart';
import 'package:app_resultado_loteria/view/lotofacil/lotofacil_page.dart';
import 'package:app_resultado_loteria/view/lotomania/lotomania_page.dart';
import 'package:app_resultado_loteria/view/mega_sena/megasena_page.dart';
import 'package:app_resultado_loteria/view/quina/quina_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontFamily: 'Roboto')
        ),
      ),
      initialRoute:'/',
      routes: {
        '/':(context) => HomePage(),
        '/lotofacil':(context) => LotofacilPage(),
        '/lotomania':(context) => LotomaniaPage(),
        '/megasena':(context) => MegaSenaPage(),
        '/quina':(context) => QuinaPage(),
      },
    );
  }
}