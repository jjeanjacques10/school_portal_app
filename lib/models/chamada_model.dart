import 'dart:convert';
import 'disciplina_model.dart';
import 'aluno_model.dart';

class ChamadaModel {
  int id;
  int presente;
  String data;
  AlunoModel alunoModel;
  DisciplinaModel cursoModel;

  ChamadaModel({
    this.id,
    this.presente,
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
        alunoModel: json["alunoModel"],
        cursoModel: json["cursoModel"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "presente": presente,
        "alunoModel": alunoModel,
        "cursoModel": cursoModel,
        "data": data,
      };
}
