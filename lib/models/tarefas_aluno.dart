import 'dart:convert';

class TarefasAluno {
  int id;
  String rmAluno;
  int idTarefas;

  TarefasAluno({
    this.id,
    this.rmAluno,
    this.idTarefas,
  });

  factory TarefasAluno.fromJson(String str) =>
      TarefasAluno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TarefasAluno.fromMap(Map<String, dynamic> json) => TarefasAluno(
        id: json["id"],
        rmAluno: json["rmAluno"],
        idTarefas: json["idTarefas"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "rmAluno": rmAluno,
        "idTarefas":idTarefas,
      };
}
