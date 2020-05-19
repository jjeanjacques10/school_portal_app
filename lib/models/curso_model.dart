import 'dart:convert';
import 'professor_model.dart';
import 'turma_model.dart';


class CursoModel {
  int id;
  String nome;
  TurmaModel turmaModel;
  ProfessorModel professorModel;

  CursoModel({
    this.id,
    this.nome,
    this.turmaModel,
    this.professorModel,
  });

  factory CursoModel.fromJson(String str) =>
      CursoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CursoModel.fromMap(Map<String, dynamic> json) => CursoModel(
        id: json["id"],
        nome: json["nome"],
        turmaModel: json["turmaModel"],
        professorModel: json["professorModel"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "turmaModel": turmaModel,
        "professorModel":professorModel,
      };
}
