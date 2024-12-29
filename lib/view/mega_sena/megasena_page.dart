import 'package:app_resultado_loteria/services/api_service.dart';
import 'package:app_resultado_loteria/widgets/dezenas_sorteadas.dart';
import 'package:app_resultado_loteria/widgets/informacoes_concurso.dart';
import 'package:app_resultado_loteria/widgets/premiacao.dart';
import 'package:flutter/material.dart';

class MegaSenaPage extends StatefulWidget {
  const MegaSenaPage({super.key});

  @override
  State<MegaSenaPage> createState() => _MegaSenaPageState();
}

class _MegaSenaPageState extends State<MegaSenaPage> {
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
    apiLoteriaData('megasena');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultado Mega Sena')),
      body: Container(
        color: Colors.blue[600],
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
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
                            apiLoteriaData('megasena/$concurso');
                            Future.delayed(Duration(milliseconds: 500), () {
                             _textController.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF558B2F),
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
                          cor: Color(0xFF558B2F), 
                          numeros: List<String>.from(resultado?['dezenasSorteadasOrdemSorteio'] ?? [])..sort()
                        ),
                        SizedBox(height: 24),
                        PremiacaoWidget(
                          cor: Color(0xFF558B2F), 
                          premiacao: List<Map<String, dynamic>>.from(resultado?['listaRateioPremio'] ?? [])
                        ),
                        SizedBox(height: 24),
                        InformacoesConcursoWidget(
                          cor: Color(0xFF558B2F),
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