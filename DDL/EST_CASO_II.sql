
CREATE TABLE Passageiros (
    id_passageiro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);


ALTER TABLE Passageiros 
ADD email VARCHAR(100);


DROP TABLE IF EXISTS Passageiros;



CREATE TABLE Voos (
    id_voo INT PRIMARY KEY AUTO_INCREMENT,
    codigo_voo VARCHAR(10) UNIQUE NOT NULL,
    origem VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL,
    horario_partida DATETIME NOT NULL,
    horario_chegada DATETIME NOT NULL
);


ALTER TABLE Voos 
ADD status VARCHAR(20) CHECK (status IN ('agendado', 'cancelado', 'em voo', 'concluído'));


DROP TABLE IF EXISTS Voos;



CREATE TABLE Aeroportos (
    id_aeroporto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_aeroporto VARCHAR(5) UNIQUE NOT NULL,
    nome_aeroporto VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    pais VARCHAR(50)
);


ALTER TABLE Aeroportos 
ADD capacidade INT;


DROP TABLE IF EXISTS Aeroportos;



CREATE TABLE Aeronaves (
    id_aeronave INT PRIMARY KEY AUTO_INCREMENT,
    identificador VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    capacidade_passageiros INT NOT NULL
);


ALTER TABLE Aeronaves 
ADD ano_fabricacao YEAR;


DROP TABLE IF EXISTS Aeronaves;



CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    funcao VARCHAR(50),
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);


ALTER TABLE Funcionarios 
ADD email VARCHAR(100);


DROP TABLE IF EXISTS Funcionarios;



CREATE TABLE Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_passageiro INT NOT NULL,
    id_voo INT NOT NULL,
    data_reserva DATE NOT NULL,
    FOREIGN KEY (id_passageiro) REFERENCES Passageiros(id_passageiro),
    FOREIGN KEY (id_voo) REFERENCES Voos(id_voo)
);


ALTER TABLE Reservas 
ADD status_reserva VARCHAR(20) CHECK (status_reserva IN ('confirmada', 'cancelada'));


DROP TABLE IF EXISTS Reservas;



CREATE TABLE OperacoesVoo (
    id_operacao INT PRIMARY KEY AUTO_INCREMENT,
    id_voo INT NOT NULL,
    id_funcionario INT NOT NULL,
    funcao VARCHAR(50) CHECK (funcao IN ('piloto', 'comissário', 'equipe de solo')),
    FOREIGN KEY (id_voo) REFERENCES Voos(id_voo),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);


ALTER TABLE OperacoesVoo 
ADD turno_trabalho VARCHAR(20);


DROP TABLE IF EXISTS OperacoesVoo;
