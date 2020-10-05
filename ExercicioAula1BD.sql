CREATE TABLE estrelas.cidade(
nome VARCHAR (32) NOT NULL,
CEP VARCHAR (9) NOT NULL PRIMARY KEY,
numero_habitantes INT NOT NULL,
capital BIT NOT NULL,
estado VARCHAR (2) NOT NULL,
renda_per_capta DECIMAL (6,2) NOT NULL,
data_de_fundacao DATE NOT NULL
);

INSERT INTO estrelas.cidade (nome,
CEP,
numero_habitantes,
capital,
estado,
renda_per_capta,
data_de_fundacao)
VALUES
('Uberlândia', '38408-272', 604013, 0, 'MG', 1001.45, '1888-08-31');	

INSERT INTO estrelas.cidade (nome,
CEP,
numero_habitantes,
capital,
estado,
renda_per_capta,
data_de_fundacao)
VALUES
('Piracicaba', '13411-142', 297767, 0, 'SP', 2900.00, '1767-08-01'),
('Rio Branco', '69911-490', 407319, 1, 'AC', 769.00, '1822-09-07'),
('São Mateus', '29936-168', 69824, 0, 'ES', 1000.00, '1544-09-21'),
('Sapucaia do Sul', '93222-065', 138357, 0, 'RS', 700.00, '1912-07-17');

DELETE FROM estrelas.cidade
WHERE CEP IN ('13411-142', '29936-168');

UPDATE estrelas.cidade
SET numero_habitantes = 664414
WHERE CEP = '38408-272';

UPDATE estrelas.cidade
SET numero_habitantes = 448050
WHERE CEP = '69911-490';

CREATE TABLE estrelas.estado (
sigla VARCHAR (2) PRIMARY KEY NOT NULL,
nome varchar (19) NOT NULL
);

INSERT INTO estrelas.estado (
sigla,
nome
)
VALUES
('MG', 'Minas Gerais'), ('AC', 'Acre'), ('RS', 'Rio Grande do Sul');

ALTER TABLE estrelas.cidade
ADD CONSTRAINT estado_fk
FOREIGN KEY (estado)
REFERENCES estrelas.estado (sigla)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE estrelas.estado
ADD COLUMN regiao TEXT NOT NULL;

UPDATE estrelas.estado
SET regiao = 'Norte'
WHERE sigla = 'AC';

UPDATE estrelas.estado
SET regiao = 'Sudeste'
WHERE sigla = 'MG';

UPDATE estrelas.estado
SET regiao = 'Sul'
WHERE sigla = 'RS';
