
CREATE TABLE Fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    pais_origem VARCHAR(50),
    contato VARCHAR(100),
    telefone VARCHAR(20),
    historico_fornecimento TEXT
);


ALTER TABLE Fornecedores 
ADD email VARCHAR(100);


DROP TABLE IF EXISTS Fornecedores;


CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    especificacoes_tecnicas TEXT,
    unidade_medida VARCHAR(20),
    preco_unitario DECIMAL(10, 2)
);


ALTER TABLE Produtos 
ADD categoria VARCHAR(50);


DROP TABLE IF EXISTS Produtos;


CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    quantidade_atual INT NOT NULL,
    localizacao VARCHAR(100),
    ponto_ressuprimento INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);


ALTER TABLE Estoque 
ADD data_ultimo_reabastecimento DATE;


DROP TABLE IF EXISTS Estoque;


CREATE TABLE PedidosCompra (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_fornecedor INT,
    data_pedido DATE NOT NULL,
    data_entrega_esperada DATE,
    status VARCHAR(20) CHECK (status IN ('em processamento', 'enviado', 'recebido', 'cancelado')),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);


ALTER TABLE PedidosCompra 
ADD observacao TEXT;


DROP TABLE IF EXISTS PedidosCompra;


CREATE TABLE RecebimentoMateriais (
    id_recebimento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    data_recebimento DATE NOT NULL,
    quantidade_recebida INT NOT NULL,
    condicao VARCHAR(20) CHECK (condicao IN ('aceito', 'rejeitado')),
    motivo_rejeicao TEXT,
    FOREIGN KEY (id_pedido) REFERENCES PedidosCompra(id_pedido)
);


ALTER TABLE RecebimentoMateriais 
ADD responsavel_recebimento VARCHAR(100);


DROP TABLE IF EXISTS RecebimentoMateriais;


CREATE TABLE Filiais (
    id_filial INT PRIMARY KEY AUTO_INCREMENT,
    nome_filial VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    capacidade_armazenamento INT
);


ALTER TABLE Filiais 
ADD cidade VARCHAR(50);


DROP TABLE IF EXISTS Filiais;


CREATE TABLE Transferencias (
    id_transferencia INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    id_filial INT,
    quantidade_transferida INT NOT NULL,
    data_transferencia DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_filial) REFERENCES Filiais(id_filial)
);


ALTER TABLE Transferencias 
ADD transporte VARCHAR(50);


DROP TABLE IF EXISTS Transferencias;
