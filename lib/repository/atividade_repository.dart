import 'package:school_portal_app/models/atividade_model.dart';
import 'package:school_portal_app/repository/database_helper.dart';

class AtividadeRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  AtividadeRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<AtividadeModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "AtividadeModel",
      columns: [
        "id",
        "nota",
        "tipo",
        "dataEntrega",
        "idDisciplina",
      ],
    );
    //Converte a lista de Maps para Lista de Cursos
    List<AtividadeModel> listaAtividade = new List<AtividadeModel>();
    for (Map i in result) {
      listaAtividade.add(AtividadeModel.fromMap(i));
    }

    return listaAtividade;
  }

  Future<int> create(AtividadeModel atividadeModel) async {
    var connection = await _databaseHelper.connection;

    var result = await connection.insert(
      "AtividadeModel",
      atividadeModel.toMap(),
    );
    return result;
  }
}
