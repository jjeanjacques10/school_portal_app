
import 'package:school_portal_app/models/disciplina_model.dart';
import 'package:school_portal_app/repository/database_helper.dart';

class DisciplinaRepository{
 // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  DisciplinaRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  
  Future<DisciplinaModel> getRaw(int id) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = "SELECT * FROM DisciplinaModel WHERE id = $id  ";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      return new DisciplinaModel.fromMap(results.first);
    } else {
      return null;
    }
  }

}