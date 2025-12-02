UniBook – Scripts SQL do Projeto de Banco de Dados

Este repositório contém os scripts SQL desenvolvidos para o projeto UniBook, um sistema de gestão de biblioteca universitária.
Os scripts foram produzidos para uso em MySQL Workbench (compatível também com MariaDB com pequenas adaptações).

📌 Conteúdo do Repositório
Arquivo	Descrição
create_tables_01.sql	Criação das tabelas do modelo lógico, incluindo PK, FK e restrições.
insert_data_02.sql	Inserção de dados iniciais (INSERT).
select_queries_03.sql	Consultas SQL (SELECT) com JOIN, WHERE, ORDER BY etc.
update_data_04.sql	Comandos UPDATE com condições.
delete_data_05.sql	Comandos DELETE seguros e condicionais.

✅ Estrutura do projeto

```
unibook-sql/
│
├── README.md
│
├── create_tables_01.sql
├── insert_data_02.sql
├── select_queries_03.sql
├── update_data_04.sql
└── delete_data_05.sql

```

🛠️ Como Executar

1. Crie um banco de dados no MySQL:

```
CREATE DATABASE unibook;
USE unibook;
```
2. Execute os scripts na ordem:

```
create_tables_01.sql
insert_data_02.sql
select_queries_03.sql  (para testes)
update_data_04.sql
delete_data_05.sql
```
3. Certifique-se de que as chaves estrangeiras estão habilitadas:

```
SET FOREIGN_KEY_CHECKS = 1;
```

🗂️ Agora seguem os scripts completos:

📌 create_tables_01.sql

```
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
```

📌 insert_data_02.sql

```
INSERT INTO USUARIO (nome, cpf_rg, tipo_usuario, email, telefone, endereco, data_cadastro, status)
VALUES
('João Pereira', '11122233344', 'Estudante', 'joao@mail.com', '99999-1111', 'Rua A, 100', '2024-01-10', 'ativo'),
('Maria Souza', '22233344455', 'Professor', 'maria@mail.com', '99999-2222', 'Rua B, 200', '2024-01-12', 'ativo'),
('Carlos Lima', '33344455566', 'Estudante', 'carlos@mail.com', '99999-3333', 'Rua C, 300', '2024-01-15', 'suspenso');

INSERT INTO BIBLIOTECARIO (usuario_id, matricula, nivel_acesso)
VALUES (2, 'BIB1001', 'Administrador');

INSERT INTO CATEGORIA (nome, descricao)
VALUES 
('Tecnologia', 'Livros da área de TI'),
('Literatura', 'Obras literárias clássicas');

INSERT INTO LIVRO (titulo, isbn, editora, ano_publicacao, resumo, categoria_id)
VALUES
('Banco de Dados Moderno', '9780001112223', 'TechEdit', 2020, 'Livro sobre SGBDs modernos', 1),
('Dom Casmurro', '9789998887771', 'Clássicos BR', 1899, 'Romance de Machado de Assis', 2);

INSERT INTO AUTOR (nome, nacionalidade, data_nascimento)
VALUES
('Dr. Silva', 'Brasileiro', '1975-03-10'),
('Machado de Assis', 'Brasileiro', '1839-06-21');

INSERT INTO LIVRO_AUTOR (livro_id, autor_id, ordem_autoria)
VALUES
(1, 1, 1),
(2, 2, 1);

INSERT INTO EXEMPLAR (codigo_barras, livro_id, estado, data_aquisicao)
VALUES
('EX001-A', 1, 'Disponível', '2022-01-01'),
('EX002-A', 1, 'Disponível', '2022-01-01'),
('EX003-B', 2, 'Disponível', '2020-02-02');

INSERT INTO EMPRESTIMO (exemplar_id, usuario_id, bibliotecario_id, data_emprestimo, data_devolucao_prevista, status)
VALUES
(1, 1, 1, '2024-02-01', '2024-02-15', 'EmAberto'),
(3, 2, 1, '2024-02-05', '2024-02-20', 'EmAberto');

INSERT INTO RESERVA (livro_id, usuario_id, data_reserva, status)
VALUES
(2, 3, '2024-02-08', 'Pendente');
```

3. 📌 select_queries_03.sql

```
-- 1. Consulta simples
SELECT nome, email FROM USUARIO WHERE status = 'ativo';

-- 2. Ordenação
SELECT titulo, ano_publicacao 
FROM LIVRO 
ORDER BY ano_publicificacao DESC;

-- 3. JOIN entre Livro e Autor
SELECT L.titulo, A.nome AS autor
FROM LIVRO L
JOIN LIVRO_AUTOR LA ON L.livro_id = LA.livro_id
JOIN AUTOR A ON LA.autor_id = A.autor_id;

-- 4. Consulta com múltiplos JOINs
SELECT U.nome AS usuario, L.titulo, E.data_emprestimo
FROM EMPRESTIMO E
JOIN USUARIO U ON E.usuario_id = U.usuario_id
JOIN EXEMPLAR EX ON E.exemplar_id = EX.exemplar_id
JOIN LIVRO L ON EX.livro_id = L.livro_id;

-- 5. LIMIT e filtro
SELECT * FROM RESERVA WHERE status = 'Pendente' LIMIT 1;
```

📌 update_data_04.sql

```
UPDATE USUARIO
SET status = 'suspenso'
WHERE usuario_id = 1;

UPDATE LIVRO
SET ano_publicacao = 2021
WHERE livro_id = 1;

UPDATE EMPRESTIMO
SET data_devolucao_real = '2024-02-14', status = 'Devolvido'
WHERE emprestimo_id = 1;
```

📌 delete_data_05.sql

```
DELETE FROM RESERVA
WHERE reserva_id = 1;

DELETE FROM EXEMPLAR
WHERE exemplar_id = 2 AND estado = 'Disponível';

DELETE FROM LIVRO_AUTOR
WHERE livro_id = 1 AND autor_id = 1;
```


🧰 Tecnologias Utilizadas

```
- MySQL Workbench

- SQL (DDL + DML)

- GitHub para versionamento e compartilhamento
```

👤 Autor

Nome: Patricia Marinho

*Projeto acadêmico desenvolvido para disciplina de Modelagem e Projeto de Banco de Dados.


📜 Licença

Este projeto é de uso acadêmico e educacional.
