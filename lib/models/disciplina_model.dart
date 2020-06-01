import 'dart:convert';

class DisciplinaModel {
  int id;
  String nome;
  String rmProfessor;

  DisciplinaModel({
    this.id,
    this.nome,
    this.rmProfessor,
  });

  factory DisciplinaModel.fromJson(String str) =>
      DisciplinaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DisciplinaModel.fromMap(Map<String, dynamic> json) => DisciplinaModel(
        id: json["id"],
        nome: json["nome"],
        rmProfessor: json["rmProfessor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "rmProfessor":rmProfessor,
      };
}
