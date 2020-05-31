import 'package:path/path.dart';
import 'package:school_portal_app/models/chamada_aluno.dart';
import 'package:school_portal_app/models/professor_model.dart';
import 'package:school_portal_app/models/tarefas_model.dart';
import 'package:school_portal_app/models/turma_model.dart';
import 'package:sqflite/sqflite.dart';

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
      version: 2,
      onCreate: _createTables,
    );

    return database;
  }

  void _createTables(Database database, int version) async {
    // Criando a tabela de Cursos

    await database.execute('''
      CREATE TABLE TurmaModel(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT NULL,
          disciplina TEXT NULL,
          horario TEXT,
          inicio TEXT,
          termino TEXT
        );
      
      ''');

    await database.execute(
      '''
       CREATE TABLE  ProfessorModel(
        rm TEXT PRIMARY KEY,
        nome TEXT,
        senha TEXT NOT NULL
      );
      ''',
    );
    await database.execute(
      ''' 
      CREATE TABLE AlunoModel(
        rm TEXT PRIMARY KEY ,
        nome TEXT,
        foto TEXT,
        idTurma INTEGER,
        FOREIGN KEY(idTurma) REFERENCES turmaModel(id)
      );
      ''',
    );
    await database.execute(
      '''
      CREATE TABLE DisciplinaModel (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        rmProfessor TEXT,
        FOREIGN KEY(rmProfessor) REFERENCES ProfessorModel(rm)
      );
      ''',
    );
    await database.execute(
      '''
      CREATE TABLE DisciplinaTurma(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        idDisciplina INTEGER,
        idTurma INTEGER,
        FOREIGN KEY(idDisciplina) REFERENCES DisciplinaModel(id),
        FOREIGN KEY(idTurma) REFERENCES DisciplinaModel(id)
      );
      ''',
    );
    await database.execute(
      '''
     CREATE TABLE TarefasModel(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        tipo TEXT,
        turma TEXT,
        disciplina TEXT,
        data TEXT
      );
      ''',
    );

    await database.execute(
      '''
      CREATE TABLE TarefasAluno(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        rmAluno TEXT,
        idTarefas INTEGER,
        FOREIGN KEY(rmAluno) REFERENCES AlunoModel(rm),
        FOREIGN KEY(idTarefas) REFERENCES TarefasModel(id)
      );
      ''',
    );

    await database.execute(
      '''
      CREATE TABLE ChamadaModel(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        presente INTEGER DEFAULT 0,
        data TEXT,
        rmAluno TEXT,
        idDisciplinaTurma INTEGER,
        FOREIGN KEY(rmAluno) REFERENCES AlunoModel(rm),
        FOREIGN KEY(idDisciplinaTurma) REFERENCES DisciplinaTurma(id)
      );
      ''',
    );

    await database.execute(
      '''
      CREATE TABLE ChamadaAluno(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        foto TEXT,
        rmAluno TEXT,
        presente INTEGER DEFAULT 0,
        turma TEXT
      );
      ''',
    );

    await database.insert("ProfessorModel",
        new ProfessorModel(rm: "123", nome: "Flavio", senha: "123").toMap());
    await database.insert("ProfessorModel",
        new ProfessorModel(rm: "1234", nome: "Pedro", senha: "123").toMap());

    await database.insert(
        "TurmaModel",
        new TurmaModel(
          id: 1,
          nome: '2SIA',
          disciplina: 'Flutter',
          horario: 'Manhã',
          inicio: '8:00',
          termino: '9:40',
        ).toMap());

    await database.insert(
        "TurmaModel",
        new TurmaModel(
          id: 2,
          nome: '3SIB',
          disciplina: 'Mobile',
          horario: 'Manhã',
          inicio: '8:00',
          termino: '9:40',
        ).toMap());

    await database.insert(
        "TurmaModel",
        new TurmaModel(
          id: 3,
          nome: '3SIA',
          disciplina: 'Web Services',
          horario: 'Manhã',
          inicio: '8:00',
          termino: '9:40',
        ).toMap());

    await database.insert(
        "ChamadaAluno",
        new ChamadaAluno(
          id: 1,
          nome: 'Vitor Rico',
          foto:
              'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
          rmAluno: 'RM80515',
          presente: 1,
          turma: '3SIA',
        ).toMap());

    await database.insert(
        "ChamadaAluno",
        new ChamadaAluno(
          id: 2,
          nome: 'Vinicius Mota',
          foto:
              'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
          rmAluno: 'RM81238',
          presente: 1,
          turma: '3SIB',
        ).toMap());

    await database.insert(
        "ChamadaAluno",
        new ChamadaAluno(
          id: 3,
          nome: 'Gabriel Petillo',
          foto:
              'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
          rmAluno: 'RM81238',
          presente: 0,
          turma: '3SIB',
        ).toMap());

    await database.insert(
        "ChamadaAluno",
        new ChamadaAluno(
          id: 4,
          nome: 'Jean Jacques',
          foto:
              'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
          rmAluno: 'RM81524',
          presente: 0,
          turma: '3SIB',
        ).toMap());

    await database.insert(
        "ChamadaAluno",
        new ChamadaAluno(
          id: 5,
          nome: 'Jean Jacques',
          foto:
              'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
          rmAluno: 'RM81534',
          presente: 0,
          turma: '2SIA',
        ).toMap());

    await database.insert(
        "TarefasModel",
        new TarefasModel(
          id: 1,
          titulo: 'Prova Teste',
          tipo: 'NAC',
          turma: '3SIA',
          disciplina: 'Flutter',
          data: '11/02/2019',
        ).toMap());

    await database.insert(
        "TarefasModel",
        new TarefasModel(
          id: 2,
          titulo: 'Prova Teste 2',
          tipo: 'NAC',
          turma: '3SIA',
          disciplina: 'Flutter',
          data: '11/02/2019',
        ).toMap());

    await database.insert(
        "TarefasModel",
        new TarefasModel(
          id: 3,
          titulo: 'Prova Teste 3',
          tipo: 'NAC',
          turma: '3SIB',
          disciplina: 'Flutter',
          data: '11/02/2019',
        ).toMap());
  }
}
