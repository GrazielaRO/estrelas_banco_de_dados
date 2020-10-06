use estrelas;

-- 1
SELECT c.nome, c.renda_per_capta
FROM cidade c
WHERE c.numero_habitantes > 250000;

-- 2
SELECT c.*
FROM cidade c
WHERE c.data_de_fundacao > '1900-03-12';

-- 3
SELECT c.*
FROM cidade c
WHERE c.CEP = '69911-490';

-- 4
SELECT	c.nome
FROM cidade c
WHERE c.estado = 'MG';

-- 5
SELECT c.*
FROM cidade c
WHERE c.estado = 'RS' and c.numero_habitantes > 135000;

-- 6
SELECT c.nome
FROM cidade c
WHERE c.capital = 1 and c.renda_per_capta > 1000.00;

-- 7
SELECT c.nome, e.nome
FROM cidade c, estado e
WHERE c.estado = e.sigla and e.sigla = 'MG';

-- 8
SELECT e.regiao, e.nome, c.nome, c.numero_habitantes
FROM cidade c, estado e
WHERE c.estado = e.sigla and c.renda_per_capta > 1000.00 and c.capital = 0;

-- 9
SELECT c.*
FROM cidade c, estado e
WHERE c.estado = e.sigla and e.regiao = 'Sul';

-- 10
SELECT c.nome, c.numero_habitantes
FROM cidade c, estado e
WHERE c.estado = e.sigla and e.regiao = 'Sul' and c.capital = 0 and c.estado <> 'SC' and c.renda_per_capta > 600