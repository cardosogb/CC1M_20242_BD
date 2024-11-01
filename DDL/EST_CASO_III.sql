
CREATE TABLE Clientes (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    cnpj CHAR(14) UNIQUE NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    ramo_atividade VARCHAR(50),
    data_cadastramento DATE NOT NULL,
    pessoa_contato VARCHAR(100)
);


ALTER TABLE Clientes 
ADD email VARCHAR(100);


DROP TABLE IF EXISTS Clientes;



CREATE TABLE Empregados (
    matricula INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    qualificacoes TEXT,
    endereco VARCHAR(255)
);


ALTER TABLE Empregados 
ADD email VARCHAR(100);


DROP TABLE IF EXISTS Empregados;



CREATE TABLE Empresas (
    cnpj CHAR(14) PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    pessoa_contato VARCHAR(100),
    endereco VARCHAR(255)
);


ALTER TABLE Empresas 
ADD email VARCHAR(100);


DROP TABLE IF EXISTS Empresas;



CREATE TABLE Fornecedores (
    cnpj CHAR(14) PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    pessoa_contato VARCHAR(100)
);


ALTER TABLE Fornecedores 
ADD email VARCHAR(100);


DROP TABLE IF EXISTS Fornecedores;



CREATE TABLE TipoEndereco (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);


ALTER TABLE TipoEndereco 
ADD descricao VARCHAR(100);


DROP TABLE IF EXISTS TipoEndereco;



CREATE TABLE Enderecos (
    numero INT,
    logradouro VARCHAR(100) NOT NULL,
    complemento VARCHAR(50),
    cep CHAR(8),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    tipo_endereco INT,
    PRIMARY KEY (numero, logradouro),
    FOREIGN KEY (tipo_endereco) REFERENCES TipoEndereco(codigo)
);


ALTER TABLE Enderecos 
ADD referencia VARCHAR(100);


DROP TABLE IF EXISTS Enderecos;



CREATE TABLE Encomendas (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    data_inclusao DATE NOT NULL,
    valor_total DECIMAL(10, 2),
    valor_desconto DECIMAL(10, 2),
    valor_liquido DECIMAL(10, 2),
    id_forma_pagamento INT,
    quantidade_parcelas INT
);


ALTER TABLE Encomendas 
ADD status VARCHAR(20);


DROP TABLE IF EXISTS Encomendas;



CREATE TABLE Produtos (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cor VARCHAR(30),
    dimensoes VARCHAR(50),
    peso DECIMAL(10, 2),
    preco DECIMAL(10, 2),
    tempo_fabricacao TIME,
    desenho BLOB,
    horas_mao_obra DECIMAL(5, 2)
);


ALTER TABLE Produtos 
ADD categoria VARCHAR(50);


DROP TABLE IF EXISTS Produtos;



CREATE TABLE TiposComponente (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);


ALTER TABLE TiposComponente 
ADD descricao VARCHAR(100);


DROP TABLE IF EXISTS TiposComponente;



CREATE TABLE Componentes (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    quantidade_estoque INT NOT NULL,
    preco_unitario DECIMAL(10, 2),
    unidade VARCHAR(20)
);


ALTER TABLE Componentes 
ADD data_ultimo_abastecimento DATE;


DROP TABLE IF EXISTS Componentes;



CREATE TABLE Maquinas (
    id_maquina INT PRIMARY KEY AUTO_INCREMENT,
    tempo_vida INT,
    data_compra DATE,
    data_fim_garantia DATE
);


ALTER TABLE Maquinas 
ADD fabricante VARCHAR(50);


DROP TABLE IF EXISTS Maquinas;



CREATE TABLE RecursosEspecificos (
    id_recurso INT PRIMARY KEY AUTO_INCREMENT,
    quantidade_necessaria INT,
    unidade VARCHAR(20),
    tempo_uso TIME,
    horas_mao_obra DECIMAL(5, 2)
);


ALTER TABLE RecursosEspecificos 
ADD descricao VARCHAR(100);


DROP TABLE IF EXISTS RecursosEspecificos;



CREATE TABLE RegistroManutencao (
    id_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    descricao TEXT
);


ALTER TABLE RegistroManutencao 
ADD responsavel VARCHAR(100);


DROP TABLE IF EXISTS RegistroManutencao;



CREATE TABLE RegistroSuprimentos (
    id_suprimento INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    data_necessidade DATE
);


ALTER TABLE RegistroSuprimentos 
ADD status VARCHAR(20);


DROP TABLE IF EXISTS RegistroSuprimentos;
