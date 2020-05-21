import 'dart:convert';
import 'professor_model.dart';
import 'turma_model.dart';


class CursoModel {
  int id;
  String nome;
  String nivel;
  String percentualConclusao;
  String preco;
  String conteudo;
  TurmaModel turmaModel;
  ProfessorModel professorModel;

  CursoModel({
    this.id,
    this.nome,
    this.nivel,
    this.percentualConclusao,
    this.preco,
    this.conteudo,
    this.turmaModel,
    this.professorModel,
  });

  factory CursoModel.fromJson(String str) =>
      CursoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CursoModel.fromMap(Map<String, dynamic> json) => CursoModel(
        id: json["id"],
        nome: json["nome"],
        nivel: json["nivel"],
        percentualConclusao: json["percentualConclusao"],
        preco: json["preco"],
        conteudo: json["conteudo"],
        turmaModel: json["turmaModel"],
        professorModel: json["professorModel"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "nivel": nivel,
        "percentualConclusao": percentualConclusao,
        "preco": preco,
        "conteudo": conteudo,
        "turmaModel": turmaModel,
        "professorModel":professorModel,
      };
}
