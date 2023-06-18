-- Active: 1686696235256@@127.0.0.1@5432@trelo_sem_6_7@public
CREATE TABLE Projetos (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(100),
  descricao VARCHAR(100),
  data_inicio DATE,
  data_prazo DATE
);
CREATE TABLE Tarefas(
  id INTEGER PRIMARY KEY,
  nome VARCHAR(100),
  data_inicio DATE,
  data_prazo DATE,
  concluida VARCHAR
);
