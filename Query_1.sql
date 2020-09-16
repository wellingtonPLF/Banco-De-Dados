-- Query Atividade --

-- 2.1)
SELECT DISTINCT chipReceptor AS "Numero", campoData AS "Data", duracao
FROM ligacao
WHERE chipEmissor = '83985100001' 
AND chipReceptor IN 
(SELECT idNumero From auditoria WHERE ligacao.campoData BETWEEN dataInicio AND dataTermino) 

-- 2.2)
SELECT EXTRACT(YEAR FROM campoData) AS "YEAR", 
EXTRACT(MONTH FROM campoData) AS "MONTH",
EXTRACT(DAY FROM campoData) AS "DAY",
SUM(duracao) AS "Σ das Ligações Realizadas"
FROM ligacao
WHERE chipEmissor = '83985100001'
GROUP BY ROLLUP(EXTRACT(YEAR FROM campoData),
				EXTRACT(MONTH FROM campoData),
				EXTRACT(DAY FROM campoData));