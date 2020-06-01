import 'dart:convert';

import 'package:school_portal_app/models/disciplina_model.dart';

class ChamadaModel {
  int id;
  String data;
  DisciplinaModel idDisciplinaTurma;

  ChamadaModel({
    this.id,
    this.data,
    this.idDisciplinaTurma,
  });

  factory ChamadaModel.fromJson(String str) =>
      ChamadaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChamadaModel.fromMap(Map<String, dynamic> json) => ChamadaModel(
        id: json["id"],
        idDisciplinaTurma: json["idDisciplinaTurma"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "idDisciplinaTurma": idDisciplinaTurma,
        "data": data,
      };
}
