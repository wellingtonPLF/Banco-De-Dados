-- Mini Povoamento --

INSERT INTO estado (uf, nome, ddd)    
VALUES ('PB', 'Paraíba',83);

-- ......... --
INSERT INTO cidade (idCidade, nome, uf) 
VALUES (DEFAULT, 'Souza', 'PB'),
		(DEFAULT, 'João Pessoa', 'PB'),
		 (DEFAULT, 'Monteiro', 'PB');
-- ......... --

-->>> CLIENTES <<<--

INSERT INTO cliente (idCliente,nome, endereco, bairro, idCidade, dataCadastro, cancelado) 
VALUES (DEFAULT, 'Wellington Pessoa', 'Rua Augusto dos Anjos, N° 34', 'Estreito', 1, '2001-09-28', 'N'),
		(DEFAULT, 'Jotaro bizzare adventure', 'Rua Anime Da Silva, N° 000', 'Urauraura', 2, '2001-09-28', 'N'),
		 (DEFAULT, ' Miguel Spanolito Pereira', 'Rua Coco dela Cruz, N°123', 'Remember Me', 3, '2001-09-28', 'N'),
		  (DEFAULT, 'Hantaro Snif Snif', 'Rua Roedores Livres, N°898', 'Mickey Mouse', 3, '2001-09-28', 'N');

-- ......... --

INSERT INTO tarifa (idTarifa, descricao,valor)
VALUES (DEFAULT, 'Ligação em roaming', 0.20),
		(DEFAULT, 'Minuto adicional ligações mesma operadora', 0.20),
		 (DEFAULT, 'Minuto adicional ligações outra operadora', 0.40);

-- ....... --

INSERT INTO plano (idPlano, descricao, fminLn, fminOut, addLigacao, roaming, valor)
VALUES (DEFAULT, 'Plano de longa Data', 20, 10, 3, 1, 5.00);

-- >>> CHIP <<< --

INSERT INTO chip (idNumero, ativo, disponivel, idPlano)
VALUES ('83985100001', 'S', 'N', 1),
		('83985100002', 'S', 'N', 1),
		 ('83985100003', 'S', 'N', 1),
		  ('83985100004', 'S', 'N', 1);

-- >>> LIGAÇÂO <<< --
		
INSERT INTO ligacao (campoData, chipEmissor, ufOrigem, chipReceptor, ufDestino, duracao)
VALUES ('2016-06-22 19:10:25', '83985100001', 'PB', '83985100002', 'PB', '2:05:15' ),
		('2016-06-25 13:20:21', '83985100001', 'PB', '83985100003', 'PB', '1:15:05' ),
		 ('2016-06-29 8:04:00', '83985100001', 'PB', '83985100004', 'PB', '3:25:02' ),
		  ('2016-07-01 04:20:11', '83985100001', 'PB', '83985100002', 'PB', '1:17:12'),
		   ('2016-07-28 15:02:31', '83985100001', 'PB', '83985100003', 'PB', '5:26:20'),
		    ('2016-08-02 07:19:10', '83985100001', 'PB', '83985100002', 'PB', '4:44:32'),
		     ('2016-08-11 11:10:56', '83985100001', 'PB', '83985100004', 'PB', '6:13:55'),
		      ('2016-09-01 12:22:44', '83985100001', 'PB', '83985100003', 'PB', '00:50:21'),
			   ('2017-09-11 09:52:12', '83985100001', 'PB', '83985100004', 'PB', '1:56:19');
		 
-- >>> AUDITORIA <<< --

INSERT INTO auditoria (idNumero, idCliente,dataInicio,dataTermino)
VALUES ('83985100001', 1, '2001-10-05', '2021-10-05'),
		('83985100003', 3, '2001-09-02', '2021-10-05'),
		 ('83985100004', 4, '2001-08-23', '2015-07-12');

-- >>> FATURA <<< --

INSERT INTO fatura(referencia, idNumero, valor_plano, tot_min_int, tot_min_ext, tx_min_exced, tx_roaming, total, pago)
VALUES ('2001-09-28 01:00', '83985100001', 0.85, 40, 20, 10.0, 0.20, 15.20, 'S');

-- >>> CLIENTE_CHIP <<< --

INSERT INTO cliente_chip(idNumero, idCliente)
VALUES ('83985100001', 1), 
		('83985100002', 2),
		 ('83985100003', 3),
		  ('83985100004', 4);



