CREATE TABLE produtos (
    id TEXT PRIMARY KEY,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    preco DECIMAL(10,2),
    categoria VARCHAR(50)
);

CREATE TABLE colaboradores (
    id TEXT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    datacontratacao DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE fornecedores (
    id TEXT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    contato VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE clientes (
    id TEXT PRIMARY KEY,
    nome VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100) DEFAULT 'Sem email',
    endereco VARCHAR(255)
);

CREATE TABLE pedidos (
    id TEXT PRIMARY KEY,
    idcliente TEXT,
    datahorapedido DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (idcliente) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE itenspedidos (
    idpedido TEXT,
    idproduto TEXT,
    quantidade INTEGER,
    precounitario DECIMAL(10,2),
    PRIMARY KEY (idpedido, idproduto),
    FOREIGN KEY (idpedido) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (idproduto) REFERENCES produtos(id) ON DELETE CASCADE
);