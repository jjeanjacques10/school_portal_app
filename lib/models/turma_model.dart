import 'dart:convert';
import 'aluno_model.dart';

class TurmaModel {
  int rm;
  String nome;
  DateTime ano;
  List<AlunoModel>alunos;

  TurmaModel({
    this.rm,
    this.nome,
    this.ano,
    this.alunos,
  });

  factory TurmaModel.fromJson(String str) =>
      TurmaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TurmaModel.fromMap(Map<String, dynamic> json) => TurmaModel(
        rm: json["rm"],
        nome: json["nome"],
        ano: json["ano"],
        alunos: json["alunos"],
      );

  Map<String, dynamic> toMap() => {
        "rm": rm,
        "nome": nome,
        "ano": ano,
        "alunos":alunos,
      };
}