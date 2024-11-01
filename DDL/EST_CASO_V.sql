
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255),
    status_fidelidade ENUM('ativo', 'inativo') DEFAULT 'ativo'
);


ALTER TABLE Clientes ADD email VARCHAR(100);


DROP TABLE IF EXISTS Clientes;


CREATE TABLE Fornecedores (
    fornecedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);


ALTER TABLE Fornecedores ADD email VARCHAR(100);


DROP TABLE IF EXISTS Fornecedores;


CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(100),
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(fornecedor_id)
);


ALTER TABLE Produtos ADD data_adicao DATE;


DROP TABLE IF EXISTS Produtos;


CREATE TABLE Vendas (
    venda_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    forma_pagamento ENUM('dinheiro', 'cartao', 'boleto', 'pix') NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);


ALTER TABLE Vendas ADD desconto DECIMAL(10, 2) DEFAULT 0;


DROP TABLE IF EXISTS Vendas;


CREATE TABLE ProdutosVendas (
    produtos_vendas_id INT PRIMARY KEY AUTO_INCREMENT,
    venda_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES Vendas(venda_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);


ALTER TABLE ProdutosVendas ADD total_produto DECIMAL(10, 2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED;


DROP TABLE IF EXISTS ProdutosVendas;


CREATE TABLE Pagamentos (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    venda_id INT,
    cliente_id INT,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    status ENUM('pago', 'pendente') NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES Vendas(venda_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);


ALTER TABLE Pagamentos ADD metodo_pagamento ENUM('dinheiro', 'cartao', 'boleto', 'pix');


DROP TABLE IF EXISTS Pagamentos;
