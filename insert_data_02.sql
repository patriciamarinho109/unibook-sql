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