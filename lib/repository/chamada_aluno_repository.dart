import 'package:school_portal_app/models/chamada_aluno.dart';
import 'package:school_portal_app/repository/database_helper.dart';

class ChamadaAlunoRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  ChamadaAlunoRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<ChamadaAluno>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "ChamadaAluno",
      columns: [
        "id",
        "nome",
        "foto",
        "rmAluno",
        "presente",
        "turma",
      ],
    );

    List<ChamadaAluno> listaChamadaAluno = new List<ChamadaAluno>();
    for (Map i in result) {
      listaChamadaAluno.add(ChamadaAluno.fromMap(i));
    }

    return listaChamadaAluno;
  }

  Future<int> update(ChamadaAluno chamadaAluno) async {
    var connection = await _databaseHelper.connection;
    return await connection.update(
      "ChamadaAluno",
      chamadaAluno.toMap(),
      where: "id = ?",
      whereArgs: [chamadaAluno.id],
    );
  }

  Future<int> create(ChamadaAluno chamadaAlunoModel) async {
    var connection = await _databaseHelper.connection;

    var result = await connection.insert(
      "ChamadaAluno",
      chamadaAlunoModel.toMap(),
    );
    return result;
  }
}
