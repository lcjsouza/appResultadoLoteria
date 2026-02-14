import 'package:resultado_loteria/constants/app_constants.dart';
import 'package:flutter/material.dart';

/// Lista vertical de botões para cada jogo disponível.
class JogosWidget extends StatelessWidget {
  const JogosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < AppConstants.jogos.length; i++) ...[
                  if (i > 0) const SizedBox(height: 50),
                  BotaoHome(config: AppConstants.jogos[i]),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Botão de navegação para um jogo específico.
class BotaoHome extends StatelessWidget {
  final JogoConfig config;

  const BotaoHome({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: config.disabled
              ? null
              : () => Navigator.of(context).pushNamed(config.rota),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor:
                config.disabled ? Colors.grey[400] : config.corDestaque,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                config.nome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ),
        if (config.disabled)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Em breve',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.indigo[900],
              ),
            ),
          ),
      ],
    );
  }
}
