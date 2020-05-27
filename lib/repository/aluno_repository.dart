import 'package:school_portal_app/models/aluno_model.dart';
import 'package:school_portal_app/repository/database_helper.dart';

class AlunoRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  AlunoRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<AlunoModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "AlunoModel",
      columns: [
        "rm",
        "nome",
        "foto",
        "idTurma",
      ],
    );
    //Converte a lista de Maps para Lista de Cursos
    List<AlunoModel> listaAluno = new List<AlunoModel>();
    for (Map i in result) {
      listaAluno.add(AlunoModel.fromMap(i));
    }

    return listaAluno;
  }

  Future<int> create(AlunoModel alunoModel) async {
    var connection = await _databaseHelper.connection;

    var result = await connection.insert(
      "AlunoModel",
      alunoModel.toMap(),
    );
    return result;
  }
}
