import 'dart:convert';

class DisciplinaTurma {
  int id;
  int idTurma;
  int idDisciplina;

  DisciplinaTurma({
    this.id,
    this.idTurma,
    this.idDisciplina,
  });

  factory DisciplinaTurma.fromJson(String str) =>
      DisciplinaTurma.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DisciplinaTurma.fromMap(Map<String, dynamic> json) => DisciplinaTurma(
        id: json["id"],
        idTurma: json["idTurma"],
        idDisciplina: json["idDisciplina"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "idTurma": idTurma,
        "idDisciplina":idDisciplina,
      };
}
