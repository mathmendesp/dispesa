import 'dart:math';

import '../entities/despesa.dart';

import './repositorio_despesa.dart';

List<Despesa> _gerarDespesasFake(int qtde) {
  List<Despesa> lista = [];
  final rand = Random(DateTime.now().millisecondsSinceEpoch);

  for (int i = 0; i < qtde; i++) {
    String id = "00$i";
    String titulo = "Despesa 00$i";
    String descricao = "Uma despesa 00$i. Uma despesa 00$i";
    double valor = rand.nextDouble() * 100;
    DateTime data = DateTime.now().add(Duration(days: -rand.nextInt(10)));
    TipoDespesa tipo =
        TipoDespesa.values[rand.nextInt(TipoDespesa.values.length)];

    lista.add(Despesa(
      id: id,
      titulo: titulo,
      descricao: descricao,
      valor: valor,
      data: data,
      tipo: tipo,
    ));
  }
  return lista;
}

class LocalRepositorioDespesa implements RepositorioDespesas {
  final List<Despesa> _despesas = [];

  LocalRepositorioDespesa() {
    _despesas.addAll(_gerarDespesasFake(2));
  }

  @override
  // TODO: implement despesas
  List<Despesa> get despesas => List.unmodifiable(_despesas);

  void adicionar(Despesa nova) {
    _despesas.add(nova);
  }
}

//Disclaimer:
//variável global para representar o repositório de despesas. Está
//longe de ser o ideal, mas para facilitar nosso contexto, iremos
//utilizar esta estratégia. NÃO DEVE SER UTILIZADA EM CÓDIGO DE PRODUÇÃO!!!!
final RepositorioDespesas repositorioDespesas = LocalRepositorioDespesa();
