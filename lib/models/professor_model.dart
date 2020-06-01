import 'dart:convert';

class ProfessorModel {
  String rm;
  String nome;
  String senha;

  ProfessorModel({
    this.rm,
    this.nome,
    this.senha,
  });

  factory ProfessorModel.fromJson(String str) =>
      ProfessorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfessorModel.fromMap(Map<String, dynamic> json) => ProfessorModel(
        rm: json["rm"],
        nome: json["nome"],
        senha: json["senha"],
      );

  Map<String, dynamic> toMap() => {
        "rm": rm,
        "nome": nome,
        "senha": senha,
      };
}
