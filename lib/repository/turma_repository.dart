import 'package:school_portal_app/repository/database_helper.dart';
import 'package:school_portal_app/models/turma_model.dart';

class TurmaRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  TurmaRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<TurmaModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "TurmaModel",
      columns: [
        "id",
        "nome",
        "disciplina",
        "horario",
        "inicio",
        "termino",
      ],
    );

    //Converte a lista de Maps para Lista de Cursos
    List<TurmaModel> listaTurmas = new List<TurmaModel>();
    for (Map i in result) {
      listaTurmas.add(TurmaModel.fromMap(i));
    }

    return listaTurmas;
  }
}
