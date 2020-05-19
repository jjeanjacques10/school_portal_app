import 'dart:convert';
import 'turma_model.dart';

class AlunoModel {
  int rm;
  String nome;
  String foto;
  TurmaModel turmaModel;

  AlunoModel({
    this.rm,
    this.nome,
    this.foto,
    this.turmaModel,
  });

  factory AlunoModel.fromJson(String str) =>
      AlunoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlunoModel.fromMap(Map<String, dynamic> json) => AlunoModel(
        rm: json["rm"],
        nome: json["nome"],
        foto: json["foto"],
        turmaModel: json["turmaModel"],
      );

  Map<String, dynamic> toMap() => {
        "rm": rm,
        "nome": nome,
        "foto": foto,
        "turmaModel": turmaModel,
      };
}