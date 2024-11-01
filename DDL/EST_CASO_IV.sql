
CREATE TABLE Alunos (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255)
);


ALTER TABLE Alunos ADD email VARCHAR(100);


DROP TABLE IF EXISTS Alunos;


CREATE TABLE Instrutores (
    instrutor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    especialidade VARCHAR(100),
    data_contratacao DATE NOT NULL
);


ALTER TABLE Instrutores ADD telefone VARCHAR(20);


DROP TABLE IF EXISTS Instrutores;


CREATE TABLE Modalidades (
    modalidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);


ALTER TABLE Modalidades ADD duracao INT;


DROP TABLE IF EXISTS Modalidades;


CREATE TABLE Matriculas (
    matricula_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    modalidade_id INT,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (modalidade_id) REFERENCES Modalidades(modalidade_id)
);


ALTER TABLE Matriculas ADD status ENUM('ativa', 'inativa');


DROP TABLE IF EXISTS Matriculas;


CREATE TABLE PlanosTreinamento (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    instrutor_id INT NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (instrutor_id) REFERENCES Instrutores(instrutor_id)
);


ALTER TABLE PlanosTreinamento ADD objetivo VARCHAR(255);


DROP TABLE IF EXISTS PlanosTreinamento;


CREATE TABLE Aulas (
    aula_id INT PRIMARY KEY AUTO_INCREMENT,
    modalidade_id INT NOT NULL,
    instrutor_id INT NOT NULL,
    horario TIME NOT NULL,
    capacidade INT NOT NULL,
    FOREIGN KEY (modalidade_id) REFERENCES Modalidades(modalidade_id),
    FOREIGN KEY (instrutor_id) REFERENCES Instrutores(instrutor_id)
);


ALTER TABLE Aulas ADD local VARCHAR(100);


DROP TABLE IF EXISTS Aulas;


CREATE TABLE InscricoesAulas (
    inscricao_id INT PRIMARY KEY AUTO_INCREMENT,
    aula_id INT NOT NULL,
    aluno_id INT NOT NULL,
    data_inscricao DATE NOT NULL,
    FOREIGN KEY (aula_id) REFERENCES Aulas(aula_id),
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id)
);


ALTER TABLE InscricoesAulas ADD status ENUM('confirmada', 'cancelada');


DROP TABLE IF EXISTS InscricoesAulas;


CREATE TABLE Pagamentos (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    status ENUM('pago', 'pendente') NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id)
);


ALTER TABLE Pagamentos ADD metodo_pagamento ENUM('cartao', 'boleto', 'pix');


DROP TABLE IF EXISTS Pagamentos;
