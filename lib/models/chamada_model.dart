import 'dart:convert';
import 'professor_model.dart';
import 'aluno_model.dart';
import 'curso_model.dart';

class ChamadaModel {
  int id;
  String presente;
  ProfessorModel professorModel;
  AlunoModel alunoModel;
  CursoModel cursoModel;
  DateTime data;

  ChamadaModel({
    this.id,
    this.presente,
    this.professorModel,
    this.alunoModel,
    this.cursoModel,
    this.data,
  });

  factory ChamadaModel.fromJson(String str) =>
      ChamadaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChamadaModel.fromMap(Map<String, dynamic> json) => ChamadaModel(
        id: json["id"],
        presente: json["presente"],
        professorModel: json["professorModel"],
        alunoModel: json["alunoModel"],
        cursoModel: json["cursoModel"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "presente": presente,
        "professorModel": professorModel,
        "alunoModel": alunoModel,
        "cursoModel": cursoModel,
        "data": data,
      };
}
