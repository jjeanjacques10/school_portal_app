import 'package:school_portal_app/models/tarefas_model.dart';
import 'package:school_portal_app/repository/database_helper.dart';

class TarefasRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  TarefasRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<TarefasModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "AtividadeModel",
      columns: [
        "nome",
        "rm",
        "foto",
        "sala",
      ],
    );
    //Converte a lista de Maps para Lista de Cursos
    List<TarefasModel> listaAtividade = new List<TarefasModel>();
    for (Map i in result) {
      listaAtividade.add(TarefasModel.fromMap(i));
    }

    return listaAtividade;
  }

  Future<int> create(TarefasModel tarefasModel) async {
    var connection = await _databaseHelper.connection;

    var result = await connection.insert(
      "TarefasModel",
      tarefasModel.toMap(),
    );
    return result;
  }
}
