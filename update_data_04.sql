UPDATE USUARIO
SET status = 'suspenso'
WHERE usuario_id = 1;

UPDATE LIVRO
SET ano_publicacao = 2021
WHERE livro_id = 1;

UPDATE EMPRESTIMO
SET data_devolucao_real = '2024-02-14', status = 'Devolvido'
WHERE emprestimo_id = 1;