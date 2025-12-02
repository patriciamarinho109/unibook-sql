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