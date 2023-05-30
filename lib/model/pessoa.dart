import 'package:flutter/material.dart';

class Pessoa {
  final String _id = UniqueKey().toString();
  String _nome;
  final List<Informacao> _informacoes = [];

  Pessoa(this._nome);

  String get id => _id;
  String get nome => _nome;
  List<Informacao> get informacoes => _informacoes;

  set nome(String nome) {
    _nome = nome;
  }

  adicionarInformacao(Informacao informacao) {
    informacoes.add(informacao);
  }

  removerInformacao(Informacao informacao) {
    informacoes.remove(informacao);
  }
}

class Informacao {
  double _altura;
  double _peso;

  Informacao(this._altura, this._peso);

  double get altura => _altura;
  double get peso => _peso;

  set altura(double altura) {
    _altura = altura;
  }

  set peso(double peso) {
    _peso = peso;
  }

  double calcularIMC() {
    return _peso / (_altura * _altura);
  }

  String resultadoIMC() {
    double valor = calcularIMC();

    if (valor < 16) {
      return "Magreza Grave";
    } else if (valor >= 16 && valor < 17) {
      return "Magreza Moderada";
    } else if (valor >= 17 && valor < 18.5) {
      return "Magreza Leve";
    } else if (valor >= 18.5 && valor < 25) {
      return "Saudável";
    } else if (valor >= 25 && valor < 30) {
      return "Sobrepeso";
    } else if (valor >= 30 && valor < 35) {
      return "Obesidade Grau I";
    } else if (valor >= 35 && valor < 40) {
      return "Obesidade Grau II (Severa)";
    } else {
      return "Obesidade Grau III (Mórbida)";
    }
  }
}
