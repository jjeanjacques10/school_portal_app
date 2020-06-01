import 'package:school_portal_app/models/chamada_model.dart';
import 'package:school_portal_app/repository/database_helper.dart';

class ChamadaRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  ChamadaRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<ChamadaModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "ChamadaModel",
      columns: [
        "id",
        "data",
        "idDisciplinaTurma",
      ],
    );
    //Converte a lista de Maps para Lista de Cursos
    List<ChamadaModel> listaChamada = new List<ChamadaModel>();
    for (Map i in result) {
      listaChamada.add(ChamadaModel.fromMap(i));
    }

    return listaChamada;
  }

  Future<int> create(ChamadaModel chamadaModel) async {
    var connection = await _databaseHelper.connection;

    var result = await connection.insert(
      "ChamadaModel",
      chamadaModel.toMap(),
    );
    return result;
  }
}
