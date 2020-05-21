import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Instancia do SQFLite Database
  static Database _database;

  // Instancia da classe Helper
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  // Fábrica de construtor
  factory DatabaseHelper() {
    return _instance;
  }

  // Construtor nomeado 
  DatabaseHelper._internal();

  

  // Abre conexão com o banco
  Future<Database> get connection async {
    if (_database == null) {
      _database = await _createDatabase();
    }
    return _database;
  }

  Future<Database> _createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'portal_app.db');

    var database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createTables,
    );

    return database;
  }

  void _createTables(Database database, int version) async {
    // Criando a tabela de Cursos
    await database.execute(
      '''
      CREATE TABLE AlunoModel(
        rm INTERGER PRIMARY KEY NOT NULL,
        nome TEXT,
        foto TEXT,
        alunoTurma INTEGER,
        FOREIGN KEY(alunoTurma) REFERENCES turmaModel(rm)
      )

      CREATE TABLE AtividadeModel(
        id INTERGER PRIMARY KEY NOT NULL,
        nota TEXT,
        tipo TEXT,
        dataEntrega TEXT,
        atividadeAluno INTEGER,
        FOREIGN KEY(atividadeAluno) REFERENCES alunoModel(rm)
      )

      CREATE TABLE ChamadaModel(
        id INTERGER PRIMARY KEY NOT NULL,
        presente TEXT,
        data TEXT,
        chamadaAluno INTEGER,
        FOREIGN KEY(chamadaAluno) REFERENCES alunoModel(rm),
        chamadaCurso INTEGER,
        FOREIGN KEY(chamadaCurso) REFERENCES cursoModel(id)
      )

      CREATE TABLE CursoModel (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        nivel TEXT,
        percentualConclusao REAL,
        preco INTEGER,
        conteudo TEXT,
        cursoTurma INTEGER,
        FOREIGN KEY(cursoTurma) REFERENCES turmaModel(rm),
        cursoProfessor INTEGER,
        FOREIGN KEY(atividadeAluno) REFERENCES alunoModel(rm)
      )

       CREATE TABLE  ProfessorModel(
        rm INTERGER PRIMARY KEY NOT NULL,
        nome TEXT,
        senha TEXT
      )

      CREATE TABLE turmaModel(
        rm INTERGER PRIMARY KEY NOT NULL,
        nome TEXT,
        ano TEXT
        turmaAluno INTEGER,
        FOREIGN KEY(turmaAluno) REFERENCES alunoModel(rm)

      )
      ''',
    );
  }
}
