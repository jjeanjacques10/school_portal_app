import 'dart:convert';


class ChamadaAluno {
  int id;
  int presente;
  String rmAluno;

  ChamadaAluno({
    this.id,
    this.presente,
    this.rmAluno,
  });

  factory ChamadaAluno.fromJson(String str) =>
      ChamadaAluno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChamadaAluno.fromMap(Map<String, dynamic> json) => ChamadaAluno(
        id: json["id"],
        presente: json["presente"],
        rmAluno: json["rmAluno"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "presente": presente,
        "rmAluno": rmAluno,
      };
}
