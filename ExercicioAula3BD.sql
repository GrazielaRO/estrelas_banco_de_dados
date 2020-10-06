use estrelas;

INSERT INTO estrelas.estado (
sigla,
nome,
regiao
)
VALUES
('GO', 'Goiás', 'Centro-oeste'), ('MT', 'Mato Grosso', 'Centro-oeste'), ('PB', 'Paraíba', 'Nordeste'), 
('RR', 'Roraima', 'Norte');

INSERT INTO estrelas.cidade (nome,
CEP,
numero_habitantes,
capital,
estado,
renda_per_capta,
data_de_fundacao)
VALUES
('Catalão', '75705-892', 106618, 0, 'GO', 1075.75, '1833-04-30'),
('Rondonópolis', '78705-162', 144049, 0, 'MT', 960.31, '1915-08-10'),
('Cabedelo', '58105-057', 66858, 0, 'PB', 1263.38, '1956-12-12'),
('Boa Vista', '69315-042', 277799, 1, 'RR', 935.19, '1890-07-09'),
('Goiânia', '74354-565', 1296000, 1, 'GO', 1521.61, '1933-10-24');

-- 1
SELECT c.nome, c.estado, c.numero_habitantes
FROM cidade c
WHERE c.estado IN ('SP', 'MG', 'GO');

-- 2
SELECT c.*
FROM cidade c
WHERE c.estado NOT IN ('SP', 'MG', 'PB');

-- 3
SELECT c.*
FROM cidade c
WHERE c.estado like 'M%';

-- 4
SELECT COUNT(*)
FROM cidade c, estado e
WHERE c.estado = e.sigla 
AND e.regiao = 'Centro-oeste'
AND c.numero_habitantes > 400000;

-- 5
SELECT SUM(c.numero_habitantes)
FROM cidade c, estado e
WHERE c.estado = e.sigla 
AND e.regiao = 'Sudeste';

-- 6
SELECT ROUND(AVG(c.renda_per_capta),2) AS 'Renda Per capita Nordeste'
FROM cidade c, estado e
WHERE c.estado = e.sigla 
AND e.regiao = 'Nordeste';

-- 7
SELECT MAX(c.numero_habitantes)
FROM cidade c, estado e
WHERE c.estado = e.sigla
AND e.regiao = 'Centro-oeste';

-- 8
SELECT ROUND(AVG(c.renda_per_capta),2) AS 'Média renda percapita'
FROM cidade c
WHERE c.capital = 1;

-- 9
SELECT MAX(c.data_de_fundacao)
FROM cidade c, estado e 
WHERE c.estado = e.sigla
AND e.regiao = 'Sudeste'
AND c.capital = 0 
AND c.numero_habitantes > 100000;

-- 10
SELECT ROUND(AVG(c.renda_per_capta),2)
FROM cidade c, estado e
WHERE c.estado = e.sigla
AND e.regiao NOT IN ('Sudeste', 'Nordeste')
AND c.data_de_fundacao > '1500-04-01'
AND c.nome like 'B%'

