import 'dart:convert';

class TurmaModel {
  int id;
  String nome;
  String ano;
  String horario;
  String inicio;
  String termino;
  

  TurmaModel({
    this.id,
    this.nome,
    this.ano,
    this.horario,
    this.inicio,
    this.termino
  });

  factory TurmaModel.fromJson(String str) =>
      TurmaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TurmaModel.fromMap(Map<String, dynamic> json) => TurmaModel(
        id: json["id"],
        nome: json["nome"],
        ano: json["ano"],
        horario: json["horario"],
        inicio: json["inicio"],
        termino: json["termino"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "ano": ano,
        "horario":horario,
        "inicio":inicio,
        "termino":termino,
      };
}