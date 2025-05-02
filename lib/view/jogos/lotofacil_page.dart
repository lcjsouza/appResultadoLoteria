import 'package:resultado_loteria/widgets/dezenas_sorteadas.dart';
import 'package:resultado_loteria/widgets/header.dart';
import 'package:resultado_loteria/widgets/informacoes_concurso.dart';
import 'package:resultado_loteria/widgets/premiacao.dart';
import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class LotofacilPage extends StatefulWidget {
  const LotofacilPage({super.key});

  @override
  State<LotofacilPage> createState() => _LotofacilPageState();
}

class _LotofacilPageState extends State<LotofacilPage> {
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
    apiLoteriaData('lotofacil');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      body: Container(
        color: Colors.blue[600],
        // width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Color(0xFF930089), width: 2)
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Lotofácil',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF930089),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 30),
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
                            apiLoteriaData('lotofacil/$concurso');
                            Future.delayed(Duration(milliseconds: 500), () {
                             _textController.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF930089),
                            foregroundColor: Color(0xFFFFFFFF), 
                          ),
                          child: Text(
                            "Buscar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                height: 3.5
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: isLoading
                        ?[
                          SizedBox(height: 50),
                            Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              ),
                            ),
                            SizedBox(height: 50),
                          ]                      
                        :[
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
                          jogo: 'lotofacil',
                          cor: Color(0xFF930089), 
                          textColor: Color(0xFFFFFFFF), 
                          numeros: List<String>.from(resultado?['dezenasSorteadasOrdemSorteio'] ?? [])..sort()
                        ),
                        SizedBox(height: 24),
                        PremiacaoWidget(
                          cor: Color(0xFF930089), 
                          premiacao: List<Map<String, dynamic>>.from(resultado?['listaRateioPremio'] ?? [])
                        ),
                        SizedBox(height: 24),
                        InformacoesConcursoWidget(
                          cor: Color(0xFF930089),
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
