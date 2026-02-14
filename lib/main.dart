import 'package:resultado_loteria/constants/app_constants.dart';
import 'package:resultado_loteria/view/about/about_page.dart';
import 'package:resultado_loteria/view/home/home_page.dart';
import 'package:resultado_loteria/view/jogos/jogo_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        // Rotas geradas dinamicamente a partir da lista de jogos em AppConstants.
        // Para adicionar um novo jogo, basta incluir um JogoConfig em AppConstants.jogos.
        for (final jogo in AppConstants.jogos)
          jogo.rota: (context) => JogoPage(config: jogo),
      },
    );
  }
}
