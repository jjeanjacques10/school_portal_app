import 'package:school_portal_app/models/professor_model.dart';
import 'package:school_portal_app/repository/database_helper.dart';

class ProfessorRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  ProfessorRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<ProfessorModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "ProfessorModel",
      columns: [
        "rm",
        "nome",
        "senha",
      ],
    );

    //Converte a lista de Maps para Lista de Cursos
    List<ProfessorModel> listaProfessores = new List<ProfessorModel>();
    for (Map i in result) {
      listaProfessores.add(ProfessorModel.fromMap(i));
    }

    return listaProfessores;
  }

  Future<ProfessorModel> login(String rm, String senha) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand =
        "SELECT * FROM ProfessorModel WHERE rm = '$rm' and senha = '$senha'";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      return new ProfessorModel.fromMap(results.first);
    } else {
      return null;
    }
  }

  Future<int> update(ProfessorModel professorModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.update(
      "ProfessorModel",
      professorModel.toMap(),
      where: "rm = ?",
      whereArgs: [professorModel.rm],
    );
  }

  Future<int> create(ProfessorModel professorModel) async {
    var connection = await _databaseHelper.connection;

    var result = await connection.insert(
      "ProfessorModel",
      professorModel.toMap(),
    );
    return result;
  }
}
