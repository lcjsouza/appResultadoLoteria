import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> resultadoData(String endpoint) async {
    final url = 'https://servicebus2.caixa.gov.br/portaldeloterias/api/$endpoint';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Erro ao chamar a API: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Erro na chamada da API: $error');
    }
  }
}
