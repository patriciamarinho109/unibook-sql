CREATE TABLE USUARIO (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf_rg VARCHAR(20) UNIQUE,
    tipo_usuario VARCHAR(20),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    data_cadastro DATE,
    status VARCHAR(20)
);

CREATE TABLE BIBLIOTECARIO (
    bibliotecario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    matricula VARCHAR(20),
    nivel_acesso VARCHAR(20),
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id)
);

CREATE TABLE CATEGORIA (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT
);

CREATE TABLE LIVRO (
    livro_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    isbn VARCHAR(20),
    editora VARCHAR(100),
    ano_publicacao INT,
    resumo TEXT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES CATEGORIA(categoria_id)
);

CREATE TABLE AUTOR (
    autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

CREATE TABLE LIVRO_AUTOR (
    livro_id INT,
    autor_id INT,
    ordem_autoria INT,
    PRIMARY KEY (livro_id, autor_id),
    FOREIGN KEY (livro_id) REFERENCES LIVRO(livro_id),
    FOREIGN KEY (autor_id) REFERENCES AUTOR(autor_id)
);

CREATE TABLE EXEMPLAR (
    exemplar_id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_barras VARCHAR(30),
    livro_id INT,
    estado VARCHAR(20),
    data_aquisicao DATE,
    FOREIGN KEY (livro_id) REFERENCES LIVRO(livro_id)
);

CREATE TABLE EMPRESTIMO (
    emprestimo_id INT PRIMARY KEY AUTO_INCREMENT,
    exemplar_id INT,
    usuario_id INT,
    bibliotecario_id INT,
    data_emprestimo DATE,
    data_devolucao_prevista DATE,
    data_devolucao_real DATE,
    status VARCHAR(20),
    FOREIGN KEY (exemplar_id) REFERENCES EXEMPLAR(exemplar_id),
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id),
    FOREIGN KEY (bibliotecario_id) REFERENCES BIBLIOTECARIO(bibliotecario_id)
);

CREATE TABLE RESERVA (
    reserva_id INT PRIMARY KEY AUTO_INCREMENT,
    livro_id INT,
    usuario_id INT,
    data_reserva DATE,
    data_notificacao DATE,
    status VARCHAR(20),
    FOREIGN KEY (livro_id) REFERENCES LIVRO(livro_id),
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id)
);