import 'dart:convert';
import 'aluno_model.dart';

class TurmaModel {
  int id;
  String nome;
  DateTime ano;
  List<AlunoModel>alunos;

  TurmaModel({
    this.id,
    this.nome,
    this.ano,
    this.alunos,
  });

  factory TurmaModel.fromJson(String str) =>
      TurmaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TurmaModel.fromMap(Map<String, dynamic> json) => TurmaModel(
        id: json["id"],
        nome: json["nome"],
        ano: json["ano"],
        alunos: json["alunos"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "ano": ano,
        "alunos":alunos,
      };
}