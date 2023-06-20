-- Active: 1686696235256@@127.0.0.1@5432@trelo_sem_6_7@public
CREATE TABLE Projetos (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(100),
  descricao VARCHAR(100),
  data_inicio DATE,
  data_prazo DATE,
);
CREATE TABLE Tarefas(
  id INTEGER PRIMARY KEY,
  nome VARCHAR(100),
  descricao VARCHAR(100),
  data_inicio DATE,
  data_prazo DATE,
  concluida VARCHAR(100),
  projeto_id INTEGER,
  categoria_id INTEGER,
  Foreign Key (projeto_id) REFERENCES Projetos(id),
  Foreign Key (categoria_id) REFERENCES Categorias(id)
);
CREATE TABLE Categorias(
  id INTEGER PRIMARY KEY,
  nome VARCHAR(100),
  descricao VARCHAR(100)
);

/*--- Inserir dados das tabelas ---*/
INSERT INTO Projetos(id, nome, descricao, data_inicio, data_prazo)
VALUES
  (1, 'Projeto A', 'Descrição do Projeto A', '2023-01-01', '2023-02-28'),
  (2, 'Projeto B', 'Descrição do Projeto B', '2023-03-01', '2023-04-30'),
  (3, 'Projeto C', 'Descrição do Projeto C', '2023-05-01', '2023-06-30');

  INSERT INTO categorias(id, nome, descricao)
  VALUES
    (1, 'Tarefa pessoal', 'Tarefas relacionadas a assuntos pessoais'),
    (2, 'Tarefa profissional', 'Tarefas relacionadas a trabalho'),
    (3, 'Tarefa acadêmica', 'Tarefas relacionadas a estudos');

INSERT INTO tarefas(id, nome, descricao, data_inicio, data_prazo, concluida, projeto_id, categoria_id)
VALUES
  (1, 'Tarefa 1','Descrição da Tarefa 1', '2023-01-05', '2023-01-15', true, 1, 1),
  (2, 'Tarefa 2','Descrição da Tarefa 2', '2023-01-10', '2023-01-20', false, 1, 2),
  (3, 'Tarefa 3','Descrição da Tarefa 3', '2023-03-05', '2023-03-15', false, 2, 3),
  (4, 'Tarefa 4','Descrição da Tarefa 4', '2023-03-10', '2023-03-20', false, 2, 1),
  (5, 'Tarefa 5','Descrição da Tarefa 5', '2023-05-05', '2023-05-15', false, 3, 2);

/*--- Scripts SQL ---*/
/*Tarefas concluídas*/
SELECT *
FROM tarefas
WHERE concluida = 'true';

/*Tarefas atrasadas*/
SELECT t.*
FROM tarefas t
JOIN projetos p ON t.projeto_id = p.id
WHERE t.concluida = 'false'
AND  t.data_prazo > p.data_prazo;


/*--- Alterar valores das colunas ---*/

UPDATE tarefas
set data_prazo = '2023-05-01'
WHERE id = 2;