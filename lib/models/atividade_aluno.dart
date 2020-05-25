import 'dart:convert';
import 'aluno_model.dart';
import 'atividade_model.dart';



class AtividadeAluno {
  int id;
  AlunoModel alunoModel;
  AtividadeModel atividadeModel;

  AtividadeAluno({
    this.id,
    this.alunoModel,
    this.atividadeModel,
  });

  factory AtividadeAluno.fromJson(String str) =>
      AtividadeAluno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AtividadeAluno.fromMap(Map<String, dynamic> json) => AtividadeAluno(
        id: json["id"],
        alunoModel: json["alunoModel"],
        atividadeModel: json["atividadeModel"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "alunoModel": alunoModel,
        "atividadeModel":atividadeModel,
      };
}
