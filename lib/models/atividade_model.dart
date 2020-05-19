import 'dart:convert';
import 'aluno_model.dart';


class CursoModel {
  int id;
  String nota;
  String tipo;
  DateTime dataEntrega;
  AlunoModel alunoModel;

  CursoModel({
    this.id,
    this.nota,
    this.tipo,
    this.dataEntrega,
    this.alunoModel,
  });

  factory CursoModel.fromJson(String str) =>
      CursoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CursoModel.fromMap(Map<String, dynamic> json) => CursoModel(
        id: json["id"],
        nota: json["nota"],
        tipo: json["tipo"],
        dataEntrega: json["dataEntrega"],
        alunoModel: json["alunoModel"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nota": nota,
        "tipo": tipo,
        "dataEntrega":dataEntrega,
        "alunoModel":alunoModel,
      };
}
