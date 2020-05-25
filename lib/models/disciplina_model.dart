import 'dart:convert';
import 'professor_model.dart';


class DisciplinaModel {
  int id;
  String nome;
  ProfessorModel professorModel;

  DisciplinaModel({
    this.id,
    this.nome,
    this.professorModel,
  });

  factory DisciplinaModel.fromJson(String str) =>
      DisciplinaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DisciplinaModel.fromMap(Map<String, dynamic> json) => DisciplinaModel(
        id: json["id"],
        nome: json["nome"],
        professorModel: json["professorModel"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "professorModel":professorModel,
      };
}
