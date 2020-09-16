CREATE TABLE estado(
	uf char(2) NOT NULL, 
	nome varchar(40) NOT NULL,
	ddd INT NOT NULL,
	CONSTRAINT pk_estado PRIMARY KEY(uf),
	CONSTRAINT ak_cobertura_ddd UNIQUE(ddd)
);

CREATE TABLE cidade(
	idCidade SERIAL NOT NULL,
	nome varchar(50) NOT NULL,
	uf char(2) NOT NULL,
	CONSTRAINT pk_cidade PRIMARY KEY(idCidade),
	CONSTRAINT fk_cidade_uf FOREIGN KEY(uf) REFERENCES estado
);

CREATE TABLE cliente(
	idCliente SERIAL NOT NULL,
	nome varchar(50) NOT NULL,
	endereco varchar(60) NOT NULL,
	bairro varchar(30) NOT NULL,
	idCidade INT NOT NULL,
	dataCadastro date NOT NULL,
	cancelado char(1) DEFAULT 'N',
	CONSTRAINT pk_cliente PRIMARY KEY(idCliente),
	CONSTRAINT fk_cliente_cidade FOREIGN KEY(idCidade) REFERENCES cidade,
	CONSTRAINT ck_cliente_cancelado CHECK(cancelado = 'N' or cancelado = 'S')
);

CREATE TABLE tarifa(
	idTarifa SERIAL NOT NULL,
	descricao varchar(50) NOT NULL,
	valor decimal NOT NULL,
	CONSTRAINT pk_tarifa PRIMARY KEY(idTarifa)
);

CREATE TABLE plano(
	idPlano SERIAL NOT NULL,
	descricao varchar(50) NOT NULL,
	fminLn INT NOT NULL,
	fminOut INT NOT NULL,
	addLigacao INT NOT NULL,
	roaming INT NOT NULL,
	valor decimal NOT NULL,
	CONSTRAINT pk_plano PRIMARY KEY(idPlano),
	CONSTRAINT fk_plano_ligacao FOREIGN KEY(addLigacao) REFERENCES Tarifa,
	CONSTRAINT fk_plano_roaming FOREIGN KEY(roaming) REFERENCES Tarifa
);

CREATE TABLE chip(
	idNumero char(11) NOT NULL,
	ativo char(1) DEFAULT 'S',
	disponivel char(1) DEFAULT 'S',
	idPlano INT NOT NULL,
	CONSTRAINT pk_chip PRIMARY KEY(idNumero),
	CONSTRAINT fk_chip_plano FOREIGN KEY(idPlano) REFERENCES plano,
	CONSTRAINT ck_chip_ativo CHECK(ativo = 'S' or ativo = 'N'),
	CONSTRAINT ck_chip_disponivel CHECK(disponivel = 'S' or disponivel = 'N')
);

CREATE TABLE cliente_chip(
	idNumero char(11) NOT NULL,
	idCliente INT NOT NULL,
	CONSTRAINT pk_cliente_chip_idNumero_idCliente PRIMARY KEY(idNumero, idCliente),
	CONSTRAINT fk_cliente_chip_idNumero FOREIGN KEY(idNumero) REFERENCES chip,
	CONSTRAINT fk_cliente_chip_idCliente FOREIGN KEY(idCliente) REFERENCES cliente
);

CREATE TABLE auditoria(
	idNumero char(11) NOT NULL,
	idCliente INT NOT NULL,
	dataInicio date NOT NULL,
	dataTermino date NOT NULL,
	CONSTRAINT pk_auditoria PRIMARY KEY(idNumero, idCliente), -- Why Not?
	CONSTRAINT fk_auditoria_idNumero FOREIGN KEY(idNUmero) REFERENCES chip,
	CONSTRAINT fk_auditoria_idCliente FOREIGN KEY(idCliente) REFERENCES cliente
);

CREATE TABLE ligacao(
	campoData timestamp NOT NULL,
	chipEmissor char(11) NOT NULL,
	ufOrigem char(2) NOT NULL,
	chipReceptor char(11) NOT NULL,
	ufDestino char(2) NOT NULL,
	duracao time NOT NULL,
	CONSTRAINT pk_ligacao PRIMARY KEY(campoData),
	CONSTRAINT fk_ligacao_chipEmissor FOREIGN KEY(chipEmissor) REFERENCES chip,
	CONSTRAINT fk_ligacao_ufOrigem FOREIGN KEY(ufOrigem) REFERENCES estado,
	CONSTRAINT fk_ligacao_ufDestino FOREIGN KEY(ufDestino) REFERENCES estado
);

CREATE TABLE fatura(
	referencia date NOT NULL, -- Date time?
	idNumero char(11) NOT NULL,
	valor_plano numeric NOT NULL,
	tot_min_int INT NOT NULL,
	tot_min_ext INT NOT NULL,
	tx_min_exced numeric NOT NULL,
	tx_roaming numeric NOT NULL,
	total numeric NOT NULL,
	pago char(1) DEFAULT 'N',
	CONSTRAINT pk_fatura PRIMARY KEY(referencia,idNumero),
	CONSTRAINT fk_fatura_idNumero FOREIGN KEY(idNumero) REFERENCES chip,
	CONSTRAINT ck_fatura_pago CHECK(pago = 'N' or pago = 'S')
	
);

