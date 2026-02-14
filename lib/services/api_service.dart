import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      'https://servicebus2.caixa.gov.br/portaldeloterias/api/';

  static const Duration _timeout = Duration(seconds: 15);

  Future<Map<String, dynamic>> resultadoData(String endpoint) async {
    final uri = Uri.parse('$_baseUrl$endpoint');

    final response = await http.get(uri).timeout(_timeout);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw Exception('Servidor retornou erro ${response.statusCode}.');
  }
}
