import 'package:app_resultado_loteria/services/api_service.dart';
import 'package:app_resultado_loteria/widgets/dezenas_sorteadas.dart';
import 'package:app_resultado_loteria/widgets/informacoes_concurso.dart';
import 'package:app_resultado_loteria/widgets/premiacao.dart';
import 'package:flutter/material.dart';

class LotomaniaPage extends StatefulWidget {
  const LotomaniaPage({super.key});

  @override
  State<LotomaniaPage> createState() => _LotomaniaPageState();
}

class _LotomaniaPageState extends State<LotomaniaPage> {
  Map<String, dynamic>? resultado;
  bool isLoading = false;
  String concurso = '';
  final TextEditingController _textController = TextEditingController();

  // Instância do ApiService para chamar a API
  final ApiService _apiService = ApiService();

  // Função para chamar a API e obter dados
  Future<void> apiLoteriaData(String jogo) async {
    setState(() {
      isLoading = true;
    });

    try {
      var data = await _apiService.resultadoData(jogo);
      setState(() {
        isLoading = false;
        resultado = data; // Armazena a resposta no estado
      });
    } catch (erro) {
      setState(() {
        isLoading = false;
        resultado = {'erro': 'Erro: $erro'};
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Chama a API quando o widget é inicializado
    apiLoteriaData('lotomania');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultado Lotomania')),
      body: Container(
        color: Colors.blue[600],
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    // Input de busca do concurso
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            controller: _textController,
                            onChanged: (text) {
                              concurso = text;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Nº Concurso',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2)
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                         ElevatedButton(
                          onPressed: () {
                            apiLoteriaData('lotomania/$concurso');
                            Future.delayed(Duration(milliseconds: 500), () {
                             _textController.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange[700],
                            foregroundColor: Colors.white
                          ),
                          child: const Text("Buscar"),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Concurso e Data Sorteio
                        Text(
                          'Concurso: ${resultado?['numero']}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Data do sorteio: ${resultado?['dataApuracao']}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'
                          ),
                        ),
                        SizedBox(height: 24),
                        DezenasSorteadasWidget(
                          cor: Color(0xFFE64A19), 
                          numeros: List<String>.from(resultado?['dezenasSorteadasOrdemSorteio'] ?? [])..sort()
                        ),
                        SizedBox(height: 24),
                        PremiacaoWidget(
                          cor: Color(0xFFE64A19), 
                          premiacao: List<Map<String, dynamic>>.from(resultado?['listaRateioPremio'] ?? [])
                        ),
                        SizedBox(height: 24),
                        InformacoesConcursoWidget(
                          cor: Color(0xFFE64A19),
                          municipioVencedor: resultado?['nomeMunicipioUFSorteio'] ?? '',
                          valorArrecadado: resultado?['valorArrecadado'] ?? 0,
                          valorAcumulado: resultado?['valorAcumuladoProximoConcurso'] ?? 0,
                          valorAcumuladoConcursoEspecial: resultado?['valorAcumuladoConcursoEspecial'] ?? 0,
                          proximoConcurso: resultado?['numeroConcursoProximo'] ?? 0,
                          dataProximoConcurso: resultado?['dataProximoConcurso'] ?? '',
                          estimativaPremio: resultado?['valorEstimadoProximoConcurso'] ?? 0,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}