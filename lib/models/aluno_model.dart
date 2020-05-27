import 'dart:convert';
import 'turma_model.dart';

class AlunoModel {
  String rm;
  String nome;
  String foto;
  int idTurma;

  AlunoModel({
    this.rm,
    this.nome,
    this.foto,
    this.idTurma,
  });

  factory AlunoModel.fromJson(String str) =>
      AlunoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlunoModel.fromMap(Map<String, dynamic> json) => AlunoModel(
        rm: json["rm"],
        nome: json["nome"],
        foto: json["foto"],
        idTurma: json["idTurma"],
      );

  Map<String, dynamic> toMap() => {
        "rm": rm,
        "nome": nome,
        "foto": foto,
        "idTurma": idTurma,
      };
}