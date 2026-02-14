import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resultado_loteria/view/home/jogos_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String _urlCaixa = 'https://www.caixa.gov.br/loterias';

  Future<void> _abrirFonteOficial(BuildContext context) async {
    final uri = Uri.parse(_urlCaixa);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Não foi possível abrir o link.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/imagens/loteria-bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.white.withOpacity(0.3)),
          const JogosWidget(),
          // Botão de informações legais
          Positioned(
            top: 12,
            right: 12,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed('/about'),
                icon: const Icon(Icons.info_outline),
                tooltip: 'Informações Legais',
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  foregroundColor: Colors.blue[800],
                ),
              ),
            ),
          ),
          // Rodapé fixo
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: _RodapeOficial(onTap: () => _abrirFonteOficial(context)),
            ),
          ),
        ],
      ),
    );
  }
}

class _RodapeOficial extends StatelessWidget {
  final VoidCallback onTap;

  const _RodapeOficial({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.black.withOpacity(0.45),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Fonte oficial: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
                fontFamily: 'Roboto',
              ),
            ),
            const Text(
              'Caixa Econômica Federal',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.open_in_new, size: 12, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}
