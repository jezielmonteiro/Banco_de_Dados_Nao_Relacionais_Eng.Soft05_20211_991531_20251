create database biblioteca;

use biblioteca;

create table autor (
	idAutor int auto_increment primary key,
    nomeAutor varchar(45) not null,
    nacionalidade varchar(45) not null
);

create table livro (
	idLivro int auto_increment primary key,
    idAutor integer not null,
    titulo varchar(45) not null,
    anoPublicacao varchar(45) not null,
    
constraint fk_livro_idAutor foreign key (idAutor)
	references autor(idAutor)
);

create table cliente (
	idCliente int auto_increment primary key,
    nomeCliente varchar(45) not null,
    email varchar(45) not null,
    telefone varchar(45)
);

create table emprestimo (
	idEmprestimo int auto_increment primary key,
    idCliente integer not null,
    idLivro integer not null,
    dtEmprestimo date,
    dtDevolucao date,
    
constraint fk_emprestimo_idCliente foreign key (idCliente)
	references cliente(idCliente),
constraint fk_emprestimo_idLivro foreign key (idLivro)
	references livro(idLivro)
);

insert into autor (nomeAutor, nacionalidade) 
values ('Machado de Assis', 'Brasileiro');
insert into autor (nomeAutor, nacionalidade) 
values ('J.K. Rowling', 'Britânica');
insert into autor (nomeAutor, nacionalidade) 
values ('George Orwell', 'Britânico');

insert into livro (idAutor, titulo, anoPublicacao) 
values (1, 'Dom Casmurro', '1899');
insert into livro (idAutor, titulo, anoPublicacao) 
values (2, 'Harry Potter e a Pedra Filosofal', '1997');
insert into livro (idAutor, titulo, anoPublicacao) 
values (3, '1984', '1949');

insert into cliente (nomeCliente, email, telefone)
values ('Ana Souza', 'ana@email.com', '11987654321');
insert into cliente (nomeCliente, email, telefone)
values ('Carlos Pereira', 'carlos@email.com', '11976543210');
insert into cliente (nomeCliente, email, telefone)
values ('Mariana Lima', 'mariana@email.com', '11965432109');

insert into emprestimo (idCliente, idLivro, dtEmprestimo, dtDevolucao) 
values (1, 1, '2024-02-01', '2024-02-10');
insert into emprestimo (idCliente, idLivro, dtEmprestimo, dtDevolucao) 
values (2, 2, '2024-02-05', null);
insert into emprestimo (idCliente, idLivro, dtEmprestimo, dtDevolucao) 
values (3, 3, '2024-02-08', null);


#(1) Insira mais 5 registros em cada tabela

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

#Tabela Livro

insert into livro (idAutor, titulo, anoPublicacao) 
values (4, 'Livro 1', '2003');
insert into livro (idAutor, titulo, anoPublicacao) 
values (5, 'Livro 2', '2010');
insert into livro (idAutor, titulo, anoPublicacao) 
values (6, 'Livro 3', '2021');
insert into livro (idAutor, titulo, anoPublicacao) 
values (7, 'Livro 4', '2001');
insert into livro (idAutor, titulo, anoPublicacao) 
values (8, 'Livro 5', '1998');

#Tabela  Cliente

insert into cliente (nomeCliente, email, telefone)
values ('Cliente 1', 'cliente1@email.com', '11987654321');
insert into cliente (nomeCliente, email, telefone)
values ('Cliente 2', 'cliente2@email.com', '11987654322');
insert into cliente (nomeCliente, email, telefone)
values ('Cliente 3', 'cliente3@email.com', '11987654323');
insert into cliente (nomeCliente, email, telefone)
values ('Cliente 4', 'cliente4@email.com', '11987654324');
insert into cliente (nomeCliente, email, telefone)
values ('Cliente 5', 'cliente5@email.com', '11987654325');

#Tabela Empréstimo 

insert into emprestimo (idCliente, idLivro, dtEmprestimo, dtDevolucao) 
values (4, 4, '2024-02-01', '2024-02-10');
insert into emprestimo (idCliente, idLivro, dtEmprestimo, dtDevolucao) 
values (5, 5, '2023-03-01', '2023-03-10');
insert into emprestimo (idCliente, idLivro, dtEmprestimo, dtDevolucao) 
values (6, 6, '2022-04-01', '2022-04-10');
insert into emprestimo (idCliente, idLivro, dtEmprestimo, dtDevolucao) 
values (7, 7, null, null);
insert into emprestimo (idCliente, idLivro, dtEmprestimo, dtDevolucao) 
values (8, 8, null, null);

#(2) Listar todos os livros disponíveis no banco

select * from livro

#(3) Listar os clientes cadastrados

select * from cliente

#(4) Listar os empréstimos que ainda não foram devolvidos

select e.idEmprestimo, e.dtEmprestimo, e.dtDevolucao
from emprestimo e
where (e.dtDevolucao is null)

#(5) Exibir os livros e seus respectivos autores (INNER JOIN)

select l.titulo, a.nomeAutor
from livro l
inner join autor a on (l.idAutor = a.idAutor)

#(6) Exibir os clientes que pegaram emprestado algum livro, mostrando o nome do livro

select c.nomeCliente, l.titulo
from cliente c
join emprestimo e on (c.idCliente = e.idCliente)
join livro l on (l.idLivro = e.idLivro)

#(7) Encontrar o autor que publicou o maior número de livros na biblioteca

select a.nomeAutor as autor, count(l.idLivro) as total_livros
from autor a
inner join livro l on a.idAutor = l.idAutor
group by a.nomeAutor
order by total_livros desc
limit 1;

#(8) Buscar clientes que pegaram livros emprestados e ainda não devolveram

select c.nomeCliente
from cliente c
join emprestimo e on (c.idCliente = e.idCliente)
join livro l on (l.idLivro = e.idLivro)
where (e.dtDevolucao is null)

#(9) Mostrar os clientes que nunca pegaram livros emprestados (LEFT JOIN + IS NULL)

select c.nomeCliente
from cliente c
left join emprestimo e on (c.idCliente = e.idCliente)
left join livro l on (l.idLivro = e.idLivro)
where (e.dtEmprestimo is null)

#(10) Exibir a média de tempo que os clientes demoram para devolver um livro

select avg(datediff(dtDevolucao, dtEmprestimo)) as media_tempo_devolucao
from emprestimo e
where dtDevolucao is not null;

#(11) Exibir os livros emprestados mais recentemente (último empréstimo registrado)

select l.titulo
from livro l 
join emprestimo e on (l.idLivro = e.idLivro)
order by e.idEmprestimo desc

#(12) Crie mais 4 consultas da sua escolha utilizar (INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN)

select l.titulo as livro, c.nomeCliente as cliente, e.dtEmprestimo, e.dtDevolucao
FROM livro l
left join emprestimo e on (l.idLivro = e.idLivro)
left join cliente c on (e.idCliente = c.idCliente)

select c.nomeCliente as cliente, l.titulo as livro, e.dtEmprestimo, e.dtDevolucao
from emprestimo e
right join cliente c on (e.idCliente = c.idCliente)
left join livro l on (e.idLivro = l.idLivro);

select c.nomeCliente as cliente, l.titulo as livro, e.dtEmprestimo, e.dtDevolucao
from cliente c
left JOIN emprestimo e on (c.idCliente = e.idCliente)
left join livro l on (e.idLivro = l.idLivro)

union

select c.nomeCliente as cliente, l.titulo as livro, e.dtEmprestimo, e.dtDevolucao
from livro l
left join emprestimo e on (l.idLivro = e.idLivro)
left join cliente c on (e.idCliente = c.idCliente);
