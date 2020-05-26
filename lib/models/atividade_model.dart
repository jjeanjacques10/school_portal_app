import 'dart:convert';
import 'aluno_model.dart';


class AtividadeModel {
  int id;
  String nota;
  String tipo;
  String dataEntrega;
  int idDisciplina;

  AtividadeModel({
    this.id,
    this.nota,
    this.tipo,
    this.dataEntrega,
    this.idDisciplina,
  });

  factory AtividadeModel.fromJson(String str) =>
      AtividadeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AtividadeModel.fromMap(Map<String, dynamic> json) => AtividadeModel(
        id: json["id"],
        nota: json["nota"],
        tipo: json["tipo"],
        dataEntrega: json["dataEntrega"],
        idDisciplina: json["idDisciplina"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nota": nota,
        "tipo": tipo,
        "dataEntrega":dataEntrega,
        "idDisciplina":idDisciplina,
      };
}
