import 'dart:convert';
import 'disciplina_model.dart';
import 'aluno_model.dart';

class ChamadaModel {
  int id;
  int presente;
  String data;
  String rmAluno;
  int idDisciplinaTurma;

  ChamadaModel({
    this.id,
    this.presente,
    this.data,
    this.rmAluno,
    this.idDisciplinaTurma,
  });

  factory ChamadaModel.fromJson(String str) =>
      ChamadaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChamadaModel.fromMap(Map<String, dynamic> json) => ChamadaModel(
        id: json["id"],
        presente: json["presente"],
        rmAluno: json["rmAluno"],
        idDisciplinaTurma: json["idDisciplinaTurma"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "presente": presente,
        "rmAluno": rmAluno,
        "idDisciplinaTurma": idDisciplinaTurma,
        "data": data,
      };
}
