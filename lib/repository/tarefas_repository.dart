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
      "TarefasModel",
      columns: [
        "id",
        "titulo",
        "tipo",
        "turma",
        "disciplina",
        "data",
        "nota",
      ],
    );
    //Converte a lista de Maps para Lista
    List<TarefasModel> listaTarefas = new List<TarefasModel>();
    for (Map i in result) {
      listaTarefas.add(TarefasModel.fromMap(i));
    }

    return listaTarefas;
  }

  Future<List<TarefasModel>> findTarefaTurma(String turmaName) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "TarefasModel",
      columns: [
        "id",
        "titulo",
        "tipo",
        "turma",
        "disciplina",
        "data",
        "nota",
      ],
      where: "turma = ?",
      whereArgs: [turmaName],
    );
    List<TarefasModel> listaTarefasModel = new List<TarefasModel>();
    for (Map i in result) {
      listaTarefasModel.add(TarefasModel.fromMap(i));
    }

    return listaTarefasModel;
  }

  Future<int> update(TarefasModel tarefaModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.update(
      "TarefasModel",
      tarefaModel.toMap(),
      where: "id = ?",
      whereArgs: [tarefaModel.id],
    );
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
