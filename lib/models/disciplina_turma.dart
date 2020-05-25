import 'dart:convert';
import 'turma_model.dart';
import 'disciplina_model.dart';


class DisciplinaTurma {
  int id;
  TurmaModel turmaModel;
  DisciplinaModel disciplinaModel;

  DisciplinaTurma({
    this.id,
    this.turmaModel,
    this.disciplinaModel,
  });

  factory DisciplinaTurma.fromJson(String str) =>
      DisciplinaTurma.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DisciplinaTurma.fromMap(Map<String, dynamic> json) => DisciplinaTurma(
        id: json["id"],
        turmaModel: json["turmaModel"],
        disciplinaModel: json["disciplinaModel"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "turmaModel": turmaModel,
        "disciplinaModel":disciplinaModel,
      };
}
