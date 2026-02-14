import 'package:flutter/material.dart';

/// Configuração de cada jogo da loteria.
///
/// Centraliza nome, rota, endpoint, cores e chaves de dados da API,
/// eliminando a necessidade de 11 páginas quase idênticas.
class JogoConfig {
  final String nome;
  final String rota;

  /// Endpoint da API (ex: 'megasena', 'diadesorte').
  final String endpoint;

  /// Cor principal: título, ícones e borda do card principal.
  final Color cor;

  /// Cor de destaque: borda dos sub-cards, fundo das bolinhas e do botão Buscar.
  /// Padrão: igual a [cor].
  final Color corDestaque;

  /// Cor do texto dentro das bolinhas e do botão Buscar.
  final Color textColor;

  /// Chave da API para a lista de dezenas sorteadas.
  final String chaveNumeros;

  /// Chave da API para o segundo sorteio (apenas Dupla Sena).
  final String? chaveNumerosDois;

  /// Se o jogo exibe trevos (apenas +Milionária).
  final bool temTrevos;

  /// Se os números devem ser ordenados antes de exibir.
  final bool ordenar;

  /// Espaço horizontal entre as bolinhas de dezenas.
  final double? espacoEntreDezenas;

  /// Se o jogo está desabilitado (em breve).
  final bool disabled;

  const JogoConfig({
    required this.nome,
    required this.rota,
    required this.endpoint,
    required this.cor,
    Color? corDestaque,
    this.textColor = const Color(0xFFFFFFFF),
    this.chaveNumeros = 'dezenasSorteadasOrdemSorteio',
    this.chaveNumerosDois,
    this.temTrevos = false,
    this.ordenar = true,
    this.espacoEntreDezenas,
    this.disabled = false,
  }) : corDestaque = corDestaque ?? cor;
}

/// Configurações centralizadas do aplicativo.
class AppConstants {
  AppConstants._();

  /// Lista de todos os jogos disponíveis, na ordem de exibição na home.
  static const List<JogoConfig> jogos = [
    JogoConfig(
      nome: 'Lotofácil',
      rota: '/lotofacil',
      endpoint: 'lotofacil',
      cor: Color(0xFF930089),
    ),
    JogoConfig(
      nome: 'Lotomania',
      rota: '/lotomania',
      endpoint: 'lotomania',
      cor: Color(0xFFf78100),
    ),
    JogoConfig(
      nome: 'Quina',
      rota: '/quina',
      endpoint: 'quina',
      cor: Color(0xFF260085),
    ),
    JogoConfig(
      nome: 'Mega Sena',
      rota: '/megasena',
      endpoint: 'megasena',
      cor: Color(0xFF209869),
    ),
    JogoConfig(
      nome: 'Timemania',
      rota: '/timemania',
      endpoint: 'timemania',
      cor: Color(0xFF049645),
      corDestaque: Color(0xFF00ff48),
      textColor: Color(0xFF006bae),
    ),
    JogoConfig(
      nome: 'Dupla Sena',
      rota: '/duplasena',
      endpoint: 'duplasena',
      cor: Color(0xFFa61324),
      chaveNumeros: 'listaDezenas',
      chaveNumerosDois: 'listaDezenasSegundoSorteio',
      espacoEntreDezenas: 6,
    ),
    JogoConfig(
      nome: 'Dia de Sorte',
      rota: '/diasorte',
      endpoint: 'diadesorte',
      cor: Color(0xFFcb852b),
      espacoEntreDezenas: 20,
    ),
    JogoConfig(
      nome: 'Super Sete',
      rota: '/supersete',
      endpoint: 'supersete',
      cor: Color(0xFFa8cf45),
      ordenar: false,
      espacoEntreDezenas: 8,
    ),
    JogoConfig(
      nome: '+ Milionária',
      rota: '/maismilionaria',
      endpoint: 'maismilionaria',
      cor: Color(0xFF2E3078),
      temTrevos: true,
    ),
    JogoConfig(
      nome: 'Federal',
      rota: '/federal',
      endpoint: 'federal',
      cor: Color(0xFF105099),
      disabled: true,
    ),
    JogoConfig(
      nome: 'Loteca',
      rota: '/loteca',
      endpoint: 'loteca',
      cor: Color(0xFFfb1f00),
      disabled: true,
    ),
  ];
}
