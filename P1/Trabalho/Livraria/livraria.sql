create database livraria;

use livraria;

create table autor (
	idAutor int auto_increment primary key,
    nomeAutor varchar(45) not null,
    nacionalidade varchar(45) not null
);

create table editora (
	idEditora int auto_increment primary key,
    nomeEditora varchar(45) not null,
    cidade varchar(45) not null
);

create table livro (
	idLivro int auto_increment primary key,
    idAutor integer not null,
    idEditora integer not null,
    titulo varchar(45) not null,
    anoPublicacao varchar(45) not null,
    preco decimal not null,
    
constraint fk_livro_idAutor foreign key (idAutor)
	references autor(idAutor),
constraint fk_livro_idEditora foreign key (idEditora)
	references editora(idEditora)
);

create table venda (
	idVenda int auto_increment primary key,
    idLivro integer not null,
    dtVenda date not null,
    qtd int not null,
    valorTotal decimal not null,

constraint fk_venda_idLivro foreign key (idLivro)
	references livro(idLivro)
);

#Tabela Autor

insert into autor (nomeAutor, nacionalidade) 
values ('Autor 1', 'Brasileiro');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 2', 'Americano');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 3', 'Alemão');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 4', 'Indiano');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 5', 'Americano');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 6', 'Espanhol');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 7', 'Indiano');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 8', 'Mexicano');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 9', 'Francês');
insert into autor (nomeAutor, nacionalidade) 
values ('Autor 10', 'Russo');

#Tabela Editora

insert into editora (nomeEditora, cidade)
values ('Editora 1', 'Cidade 1');
insert into editora (nomeEditora, cidade)
values ('Editora 2', 'Cidade 2');
insert into editora (nomeEditora, cidade)
values ('Editora 3', 'Cidade 3');
insert into editora (nomeEditora, cidade)
values ('Editora 4', 'Cidade 4');
insert into editora (nomeEditora, cidade)
values ('Editora 5', 'Cidade 5');
insert into editora (nomeEditora, cidade)
values ('Editora 6', 'Cidade 6');
insert into editora (nomeEditora, cidade)
values ('Editora 7', 'Cidade 7');
insert into editora (nomeEditora, cidade)
values ('Editora 8', 'Cidade 8');
insert into editora (nomeEditora, cidade)
values ('Editora 9', 'Cidade 9');
insert into editora (nomeEditora, cidade)
values ('Editora 10', 'Cidade 10');

#Tabela Livro

insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (1, 1, 'Livro 1', '2003', 20.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (2, 2, 'Livro 2', '2010', 16.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (3, 3, 'Livro 3', '2021', 12.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (4, 4, 'Livro 4', '2011', 9.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (5, 5, 'Livro 5', '1990', 13.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (6, 6, 'Livro 6', '2014', 26.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (7, 7, 'Livro 7', '2009', 28.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (8, 8, 'Livro 8', '2003', 29.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (9, 9, 'Livro 9', '2025', 32.00);
insert into livro (idAutor, idEditora, titulo, anoPublicacao, preco) 
values (10, 10, 'Livro 10', '2021', 35.00);

#Tabela Venda 

insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (1, '2024-02-01', 3, 60.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (2, '2023-03-01', 1, 16.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (3, '2022-04-01', 4, 50.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (4, '2022-01-23', 2, 38.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (5, '2019-06-28', 3, 39.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (6, '2014-04-17', 1, 26.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (7, '2024-06-13', 4, 114.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (8, '2021-09-07', 3, 87.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (9, '2023-11-19', 1, 32.00);
insert into venda (idLivro, dtVenda, qtd, valorTotal) 
values (10, '2020-11-07', 2, 70.00);


#1. Liste todos os livros com seus respectivos autores e editoras.

select l.titulo, a.nomeAutor, e.nomeEditora
from livro l
inner join autor a on (l.idAutor = a.idAutor)
inner join editora e on (l.idEditora = e.idEditora);

#2. Mostre o total de vendas por livro.

select l.titulo, v.qtd
from venda v
join livro l on (v.idLivro = l.idLivro);

#3. Liste os autores que têm mais de 2 livros publicados.

select a.idAutor, a.nomeAutor, count(l.idLivro) as total_livros
from autor a
join livro l on (a.idAutor = l.idAutor)
group by a.idAutor, a.nomeAutor
having count(l.idLivro) > 2;

#4. Mostre o valor total de vendas por editora.

select e.nomeEditora, v.valorTotal
from venda v
join livro l on (v.idLivro = l.idLivro)
join editora e on (l.idEditora = e.idEditora);

#5. Liste os livros publicados após o ano de 2010.

select l.titulo, l.anoPublicacao
from livro l
where (l.anoPublicacao > '2010');
