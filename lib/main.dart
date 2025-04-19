import 'package:resultado_loteria/view/home/home_page.dart';
import 'package:resultado_loteria/view/jogos/diasorte_page.dart';
import 'package:resultado_loteria/view/jogos/duplasena_page.dart';
import 'package:resultado_loteria/view/jogos/federal_page.dart';
import 'package:resultado_loteria/view/jogos/loteca_page.dart';
import 'package:resultado_loteria/view/jogos/lotofacil_page.dart';
import 'package:resultado_loteria/view/jogos/lotomania_page.dart';
import 'package:resultado_loteria/view/jogos/maismilionaria_page.dart';
import 'package:resultado_loteria/view/jogos/megasena_page.dart';
import 'package:resultado_loteria/view/jogos/quina_page.dart';
import 'package:resultado_loteria/view/jogos/supersete_page.dart';
import 'package:resultado_loteria/view/jogos/timemania_page.dart';
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
        '/timemania':(context) => TimemaniaPage(),
        '/duplasena':(context) => DuplaSenaPage(),
        '/diasorte':(context) => DiaSortePage(),
        '/supersete':(context) => SupersetePage(),
        '/maismilionaria':(context) => MaisMilionariaPage(),
        '/federal':(context) => FederalPage(),
        '/loteca':(context) => LotecaPage(),
      },
    );
  }
}