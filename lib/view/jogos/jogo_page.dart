import 'package:resultado_loteria/constants/app_constants.dart';
import 'package:resultado_loteria/services/api_service.dart';
import 'package:resultado_loteria/widgets/dezenas_sorteadas.dart';
import 'package:resultado_loteria/widgets/header.dart';
import 'package:resultado_loteria/widgets/informacoes_concurso.dart';
import 'package:resultado_loteria/widgets/premiacao.dart';
import 'package:flutter/material.dart';

/// Página genérica de resultado de loteria.
///
/// Substitui as 11 páginas individuais (megasena_page, lotofacil_page, etc.)
/// recebendo um [JogoConfig] que define nome, cores, endpoint e chaves de dados.
class JogoPage extends StatefulWidget {
  final JogoConfig config;

  const JogoPage({super.key, required this.config});

  @override
  State<JogoPage> createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  Map<String, dynamic>? _resultado;
  bool _isLoading = false;
  String _erroMensagem = '';
  int? _concursoAtual;
  String _concursoBusca = '';
  final TextEditingController _textController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _buscarDados(widget.config.endpoint);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _buscarDados(String endpoint) async {
    setState(() {
      _isLoading = true;
      _erroMensagem = '';
    });

    try {
      final data = await _apiService.resultadoData(endpoint);
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _resultado = data;
        _concursoAtual = data['numero'] as int?;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _erroMensagem = 'Não foi possível carregar os dados.\nVerifique sua conexão e tente novamente.';
      });
    }
  }

  void _irParaProximoConcurso() {
    if (_concursoAtual != null) {
      _buscarDados('${widget.config.endpoint}/${_concursoAtual! + 1}');
    }
  }

  void _irParaConcursoAnterior() {
    if (_concursoAtual != null && _concursoAtual! > 1) {
      _buscarDados('${widget.config.endpoint}/${_concursoAtual! - 1}');
    }
  }

  Future<void> _buscarConcursoEspecifico() async {
    if (_concursoBusca.isEmpty) return;
    await _buscarDados('${widget.config.endpoint}/$_concursoBusca');
    _textController.clear();
    _concursoBusca = '';
  }

  List<String> _getNumeros(String chave) {
    final nums = List<String>.from(_resultado?[chave] ?? []);
    if (widget.config.ordenar) nums.sort();
    return nums;
  }

  @override
  Widget build(BuildContext context) {
    final config = widget.config;

    return Scaffold(
      appBar: const HeaderWidget(),
      body: Container(
        color: Colors.blue[600],
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: config.cor, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      config.nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: config.cor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildNavegacaoConcurso(config),
                    const SizedBox(height: 12),
                    _buildBuscaConcurso(config),
                    const SizedBox(height: 24),
                    _buildConteudo(config),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavegacaoConcurso(JogoConfig config) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _irParaConcursoAnterior,
          icon: Icon(Icons.arrow_back_ios, color: config.cor),
          tooltip: 'Concurso anterior',
        ),
        const SizedBox(width: 8),
        Text(
          'Concurso: ${_resultado?['numero'] ?? '-'}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: _irParaProximoConcurso,
          icon: Icon(Icons.arrow_forward_ios, color: config.cor),
          tooltip: 'Próximo concurso',
        ),
      ],
    );
  }

  Widget _buildBuscaConcurso(JogoConfig config) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            controller: _textController,
            onChanged: (text) => _concursoBusca = text,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Nº Concurso',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _buscarConcursoEspecifico,
          style: ElevatedButton.styleFrom(
            backgroundColor: config.corDestaque,
            foregroundColor: config.textColor,
          ),
          child: Text(
            'Buscar',
            style: TextStyle(
              color: config.textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              height: 3.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConteudo(JogoConfig config) {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      );
    }

    if (_erroMensagem.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              _erroMensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _buscarDados(config.endpoint),
              child: const Text('Tentar novamente'),
            ),
          ],
        ),
      );
    }

    if (_resultado == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data do sorteio: ${_resultado?['dataApuracao'] ?? '-'}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 24),
        DezenasSorteadasWidget(
          jogo: config.endpoint,
          cor: config.corDestaque,
          textColor: config.textColor,
          numeros: _getNumeros(config.chaveNumeros),
          sorteioDois: config.chaveNumerosDois != null
              ? (List<String>.from(_resultado?[config.chaveNumerosDois!] ?? [])..sort())
              : null,
          trevosSorteados: config.temTrevos
              ? (List<String>.from(_resultado?['trevosSorteados'] ?? [])..sort())
              : null,
          espacoEntreDezenas: config.espacoEntreDezenas,
        ),
        const SizedBox(height: 24),
        PremiacaoWidget(
          cor: config.corDestaque,
          premiacao: List<Map<String, dynamic>>.from(
            _resultado?['listaRateioPremio'] ?? [],
          ),
        ),
        const SizedBox(height: 24),
        InformacoesConcursoWidget(
          cor: config.corDestaque,
          municipioVencedor: _resultado?['nomeMunicipioUFSorteio'] ?? '',
          valorArrecadado: (_resultado?['valorArrecadado'] ?? 0).toDouble(),
          valorAcumulado: (_resultado?['valorAcumuladoProximoConcurso'] ?? 0).toDouble(),
          valorAcumuladoConcursoEspecial: (_resultado?['valorAcumuladoConcursoEspecial'] ?? 0).toDouble(),
          proximoConcurso: _resultado?['numeroConcursoProximo'] ?? 0,
          dataProximoConcurso: _resultado?['dataProximoConcurso'] ?? '',
          estimativaPremio: (_resultado?['valorEstimadoProximoConcurso'] ?? 0).toDouble(),
        ),
      ],
    );
  }
}
