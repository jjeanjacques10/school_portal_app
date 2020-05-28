import 'dart:convert';


class TarefasModel {
   String nome;
   String rm;
   String foto;
   String sala;

  TarefasModel({
    this.nome,
    this.rm,
    this.foto,
    this.sala,
  });

  factory TarefasModel.fromJson(String str) =>
      TarefasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TarefasModel.fromMap(Map<String, dynamic> json) => TarefasModel(
        nome: json["nome"],
        rm: json["rm"],
        foto: json["foto"],
        sala: json["sala"],
      );

  Map<String, dynamic> toMap() => {
        "nome": nome,
        "rm": rm,
        "foto": foto,
        "sala":sala,
      };
}
