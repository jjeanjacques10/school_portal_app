import 'package:school_portal_app/models/professor_model.dart';
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
      version: 4,
      onCreate: _createTables,
    );

    return database;
  }

  void _createTables(Database database, int version) async {
    // Criando a tabela de Cursos

    await database.execute(
      '''
    CREATE TABLE  ProfessorModel(
        rm TEXT PRIMARY KEY ,
        nome TEXT,
        senha TEXT NOT NULL
      );

      CREATE TABLE TurmaModel(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        ano TEXT NOT NULL,
        disciplina TEXT,
        horario TEXT,
        inicio TEXT,
        termino TEXT
      );
      
      CREATE TABLE AlunoModel(
        rm TEXT PRIMARY KEY ,
        nome TEXT,
        foto TEXT,
        idTurma INTEGER,
        FOREIGN KEY(idTurma) REFERENCES turmaModel(id)
      );


      CREATE TABLE DisciplinaModel (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        nivel TEXT,
        percentualConclusao REAL,
        preco INTEGER,
        conteudo TEXT,
        idTurma INTEGER,
        rmProfessor TEXT,
        FOREIGN KEY(idTurma) REFERENCES TurmaModel(id),
        FOREIGN KEY(rmProfessor) REFERENCES ProfessorModel(rm)
      );


     CREATE TABLE AtividadeModel(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nota TEXT,
        tipo TEXT,
        dataEntrega TEXT,
        idCurso INTEGER,
        FOREIGN KEY(idCurso) REFERENCES DisciplinaModel(id)
      );

      CREATE TABLE AtividadeAluno(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        rmAluno TEXT,
        idAtividade INTEGER,
        FOREIGN KEY(rmAluno) REFERENCES AlunoModel(rm),
        FOREIGN KEY(idAtividade) REFERENCES AtividadeModel(id)
      );

      CREATE TABLE ChamadaModel(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        presente INTEGER DEFAULT 0,
        data TEXT,
        rmAluno TEXT,
        idDisciplina INTEGER,
        FOREIGN KEY(rmAluno) REFERENCES AlunoModel(rm),
        FOREIGN KEY(idDisciplina) REFERENCES DisciplinaModel(id)
      );
     
      ''',
    );
    await database.insert("ProfessorModel",
        new ProfessorModel(rm: "123", nome: "123", senha: "123").toMap());
        
  }
}
