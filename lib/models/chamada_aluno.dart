import 'dart:convert';

class ChamadaAluno {
  int id;
  String nome;
  String foto;
  String rmAluno;
  int presente;
  String turma;

  ChamadaAluno({
    this.id,
    this.nome,
    this.foto,
    this.rmAluno,
    this.presente,
    this.turma,
  });

  factory ChamadaAluno.fromJson(String str) =>
      ChamadaAluno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChamadaAluno.fromMap(Map<String, dynamic> json) => ChamadaAluno(
        id: json["id"],
        nome: json["nome"],
        foto: json["foto"],
        rmAluno: json["rmAluno"],
        presente: json["presente"],
        turma: json["turma"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "foto": foto,
        "rmAluno": rmAluno,
        "presente": presente,
        "turma": turma,
      };
}
