create database livraria;

use livraria;

CREATE TABLE
  autores (
    idAutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
  );

CREATE TABLE
  EDITORAS (
    idEditora INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(100),
    endereco varchar(150),
    pais varchar(50),
    website varchar(100)
  );

CREATE TABLE
  generos (
    idGenero INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(50),
    generoPai int
  );

CREATE TABLE
  livros (
    idLivro INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(13),
    titulo VARCHAR(150),
    anoPublicacao DATE,
    preco DECIMAL(10, 2),
    estoque INT,
    idEditora INT,
    FOREIGN KEY (idEditora) REFERENCES editoras (idEditora)
  );

CREATE TABLE
  livro_autor (
    idLivro INT,
    idAutor INT,
    PRIMARY KEY (idLivro, idAutor),
    FOREIGN KEY (idLivro) REFERENCES livros (idLivro),
    FOREIGN KEY (idAutor) REFERENCES autores (idAutor)
  );

CREATE TABLE
  livro_genero (
    idLivro INT,
    idGenero INT,
    PRIMARY KEY (idLivro, idGenero),
    FOREIGN KEY (idLivro) REFERENCES livros (idLivro),
    FOREIGN KEY (idGenero) REFERENCES generos (idGenero)
  );

CREATE TABLE
  clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    dataNascimento DATE,
    endereco VARCHAR(150)
  );

CREATE TABLE
  telefones (
    idTelefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(15),
    tipo VARCHAR(20),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente)
  );

CREATE TABLE
  compras (
    idCompra INT PRIMARY KEY AUTO_INCREMENT,
    dataCompra DATE,
    idCliente INT,
    idLivro INT,
    quantidade INT,
    precoUnitario DECIMAL(10, 2),
    formaPagamento VARCHAR(50),
    desconto DECIMAL(5, 2),
    status VARCHAR(20),
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente),
    FOREIGN KEY (idLivro) REFERENCES livros (idLivro)
  );

CREATE TABLE
  autor_livro (
    idAutor INT,
    idLivro INT,
    ordem INT,
    PRIMARY KEY (idAutor, idLivro),
    FOREIGN KEY (idAutor) REFERENCES autores (idAutor),
    FOREIGN KEY (idLivro) REFERENCES livros (idLivro)
  );

INSERT INTO
  autores (nome, nacionalidade)
VALUES
  ('Jorge Amado', 'Brasileiro'),
  ('Gabriel García Márquez', 'Colombiano'),
  ('J.K. Rowling', 'Britânica');

INSERT INTO
  editoras (nome, endereco, pais, website)
VALUES
  (
    'Editora Record',
    'Rio de Janeiro, RJ',
    'Brasil',
    'https://www.record.com.br'
  ),
  (
    'Editora Planeta',
    'São Paulo, SP',
    'Brasil',
    'https://www.planetadelivros.com.br'
  ),
  (
    'Bloomsbury Publishing',
    'Londres, Inglaterra',
    'Reino Unido',
    'https://www.bloomsbury.com'
  );

INSERT INTO
  livros (
    ISBN,
    titulo,
    anoPublicacao,
    preco,
    estoque,
    idEditora
  )
VALUES
  (
    '978-8501034878',
    'Gabriela, Cravo e Canela',
    1958,
    39.90,
    20,
    1
  ),
  (
    '978-8576653421',
    'Cem Anos de Solidão',
    1967,
    49.90,
    15,
    2
  ),
  (
    '978-8501075320',
    'Capitães da Areia',
    1937,
    35.90,
    10,
    1
  ),
  (
    '978-8576653438',
    'O Amor nos Tempos do Cólera',
    1985,
    45.90,
    8,
    2
  ),
  (
    '978-8501109315',
    'Harry Potter e a Pedra Filosofal',
    1997,
    59.90,
    30,
    3
  );

INSERT INTO
  clientes (nome, email, dataNascimento, endereco)
VALUES
  (
    'João Silva',
    'joaosilva@email.com',
    '1980-01-01',
    'Rua das Flores, 123, São Paulo, SP'
  ),
  (
    'Maria Santos',
    'mariasant@email.com',
    '1990-05-15',
    'Avenida Brasil, 456, Rio de Janeiro, RJ'
  ),
  (
    'Pedro Almeida',
    'pedroalmeida@email.com',
    '1975-11-20',
    'Rua da Paz, 789, Belo Horizonte, MG'
  ),
  (
    'Ana Oliveira',
    'anaoliveira@email.com',
    '2000-03-10',
    'Rua dos Pinheiros, 1011, São Paulo, SP'
  );

INSERT INTO
  compras (
    dataCompra,
    idCliente,
    idLivro,
    quantidade,
    precoUnitario,
    formaPagamento,
    desconto,
    status
  )
VALUES
  (
    '2023-11-15',
    1,
    1,
    2,
    39.90,
    'Cartão de crédito',
    0.00,
    'Finalizada'
  ),
  (
    '2023-11-16',
    2,
    2,
    1,
    49.90,
    'Dinheiro',
    5.00,
    'Finalizada'
  ),
  (
    '2023-11-17',
    3,
    5,
    3,
    59.90,
    'Pix',
    10.00,
    'Finalizada'
  ),
  (
    '2023-11-18',
    1,
    3,
    1,
    35.90,
    'Cartão de débito',
    0.00,
    'Finalizada'
  ),
  (
    '2023-11-19',
    4,
    4,
    2,
    45.90,
    'Boleto',
    0.00,
    'Pendente'
  ),
  (
    '2023-11-20',
    2,
    1,
    1,
    39.90,
    'Dinheiro',
    0.00,
    'Finalizada'
  );

INSERT INTO
  autor_livro (idAutor, idLivro, ordem)
VALUES
  (1, 1, 1),
  (2, 2, 1),
  (3, 5, 1);

--  Atualize o endereço de uma editora específica
UPDATE editoras
SET
  endereco = 'Avenida Paulista, 1000, São Paulo, SP'
WHERE
  nome = 'Editora Planeta';

--  Exclua um livro específico da tabela livro
DELETE FROM livros
WHERE
  ISBN = '978-8501034878';

-- WHERE titulo = 'Gabriela, Cravo e Canela' AND anoPublicacao = 1958;
-- Consultas e Ordenação:
-- Liste todos os livros publicados por uma determinada editora
SELECT
  *
FROM
  livros
WHERE
  idEditora = (
    SELECT
      idEditora
    FROM
      editoras
    WHERE
      nome = 'Editora Record'
  );

-- Liste todos os livros de um autor específico
SELECT
  l.titulo
FROM
  livros l
  JOIN autor_livro al ON l.idLivro = al.idLivro
  JOIN autores a ON al.idAutor = a.idAutor
WHERE
  a.nome = 'Jorge Amado';

-- Liste todos os clientes que compraram um livro específico
SELECT
  c.nome
FROM
  clientes c
  JOIN compras co ON c.idCliente = co.idCliente
WHERE
  co.idLivro = (
    SELECT
      idLivro
    FROM
      livros
    WHERE
      ISBN = '978-8501034878'
  );

-- Liste todas as compras realizadas em uma data específica
SELECT
  *
FROM
  compras
WHERE
  dataCompra = '2023-11-15';

-- Faça uma consulta que retorne os nomes dos clientes e os títulos dos livros que eles compraram
SELECT
  c.nome AS cliente,
  l.titulo AS livro
FROM
  clientes c
  JOIN compras co ON c.idCliente = co.idCliente
  JOIN livros l ON co.idLivro = l.idLivro;

-- Realize uma consulta que liste todos os livros em ordem alfabética pelo título
SELECT
  titulo
FROM
  livros
ORDER BY
  titulo ASC;

-- Liste todas as compras com informações dos clientes e dos livros comprados
SELECT
  c.nome AS cliente,
  l.titulo AS livro,
  co.dataCompra
FROM
  clientes c
  JOIN compras co ON c.idCliente = co.idCliente
  JOIN livros l ON co.idLivro = l.idLivro;

-- Adicione uma nova coluna preco na tabela ‘livro’ e atualize os preços dos livros já inseridos.
ALTER TABLE livros ADD preco DECIMAL(10, 2);

-- Adicione uma nova coluna preco na tabela ‘livro’ e atualize os preços dos livros já inseridos.
UPDATE livros
SET
  preco = 45.99
WHERE
  idLivro = 1;

-- Adicione uma nova coluna preco na tabela ‘livro’ e atualize os preços dos livros já inseridos.
UPDATE livros l
SET
  l.preco = (
    SELECT
      novo_preco
    FROM
      tabela_auxiliar a
    WHERE
      a.idLivro = l.idLivro
  );