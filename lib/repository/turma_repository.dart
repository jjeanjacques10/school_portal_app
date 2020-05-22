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
        "nome",
        "ano",
        "horario",
        "inicio",
        "termino",
      ],
    );

    //Converte a lista de Maps para Lista de Cursos
    List<TurmaModel> listaProfessores = new List<TurmaModel>();
    for (Map i in result) {
      listaProfessores.add(TurmaModel.fromMap(i));
    }

    return listaProfessores;
  }
}
