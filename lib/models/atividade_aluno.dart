import 'dart:convert';
import 'aluno_model.dart';
import 'atividade_model.dart';



class AtividadeAluno {
  int id;
  String rmAluno;
  int idAtividade;

  AtividadeAluno({
    this.id,
    this.rmAluno,
    this.idAtividade,
  });

  factory AtividadeAluno.fromJson(String str) =>
      AtividadeAluno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AtividadeAluno.fromMap(Map<String, dynamic> json) => AtividadeAluno(
        id: json["id"],
        rmAluno: json["rmAluno"],
        idAtividade: json["idAtividade"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "rmAluno": rmAluno,
        "idAtividade":idAtividade,
      };
}
