import 'dart:convert';

class TarefasModel {
  int id;
  String titulo;
  String tipo;
  String turma;
  String disciplina;
  String data;
 

  TarefasModel({
    this.id,
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
        id: json["id"],
        titulo: json["titulo"],
        tipo: json["tipo"],
        turma: json["turma"],
        disciplina: json["disciplina"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "tipo": tipo,
        "turma": turma,
        "disciplina": disciplina,
        "data": data,
      };
}
