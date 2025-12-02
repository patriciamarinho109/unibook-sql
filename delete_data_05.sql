DELETE FROM RESERVA
WHERE reserva_id = 1;

DELETE FROM EXEMPLAR
WHERE exemplar_id = 2 AND estado = 'Disponível';

DELETE FROM LIVRO_AUTOR
WHERE livro_id = 1 AND autor_id = 1;