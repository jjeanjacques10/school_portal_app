import 'dart:convert';


class TarefasModel {
   String titulo;
   String tipo;
   String turma;
   String disciplina;
   String data;

  TarefasModel({
    this.titulo,
    this.tipo,
    this.turma,
    this.disciplina,
    this.data,
  });

  factory TarefasModel.fromJson(String str) =>
      TarefasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TarefasModel.fromMap(Map<String, dynamic> json) => TarefasModel(
        titulo: json["titulo"],
        tipo: json["tipo"],
        turma: json["turma"],
        disciplina: json["disciplina"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "tipo": tipo,
        "turma": turma,
        "disciplina":disciplina,
        "data": data,
      };
}
