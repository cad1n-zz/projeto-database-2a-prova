create database cinema;

use cinema;

create table funcionario (
idfuncionario int not null,
nome varchar(45),
carteiraTrabalho int,
dataContratacao date,
salario float,
primary key (idfuncionario)
);

create table filme (
idfilme int not null,
nomeBR varchar(45),
nomeEN varchar(45),
anoLancamento int not null,
diretor_idDiretor int not null,
sinopse text,
genero_idgenero int not null,
primary key (idfilme),
foreign key (diretor_idDiretor) references diretor (idDiretor),
foreign key (genero_idgenero) references genero (idgenero)
);

create table filme_has_premiacao (
filme_idfilme int not null,
premiacao_idpremiacao int not null,
ganhou bool,
primary key (filme_idfilme,premiacao_idpremiacao),
foreign key (filme_idfilme) references filme (idfilme),
foreign key (premiacao_idpremiacao) references premiacao (idpremiacao)
);

create table premiacao (
idpremiacao int not null,
nome varchar(45),
ano int not null,
primary key (idpremiacao)
);

create table diretor (
idDiretor int not null,
nome varchar(45),
primary key (idDiretor)
);

create table genero (
idgenero int not null,
nome varchar(45),
primary key (idgenero)
);

create table sala (
idsala int not null,
nome varchar (45),
capacidade int not null,
primary key (idsala)
);

create table horario (
idhorario int not null,
horario time,
primary key (idhorario)
);

create table funcao (
idfuncao int not null,
nome varchar (45),
primary key (idfuncao)
);

create table filme_exibido_sala (
filme_idfilme int not null,
sala_idsala int not  null,
horario_idhorario int not null,
primary key (filme_idfilme,sala_idsala,horario_idhorario),
foreign key (filme_idfilme) references filme (idfilme),
foreign key (sala_idsala) references sala (idsala),
foreign key (horario_idhorario) references horario (idhorario)
);

create table horario_trabalho_funcionario (
horario_idhorario int not null,
funcionario_idfuncionario int not null,
funcao_idfuncao int not null,
primary key (horario_idhorario, funcionario_idfuncionario,funcao_idfuncao),
foreign key (horario_idhorario) references horario (idhorario),
foreign key (funcionario_idfuncionario) references funcionario (idfuncionario),
foreign key (funcao_idfuncao) references funcao (idfuncao)
);

--inserindo valores na tabela funcionário
insert into funcionario(idfuncionario, nome, carteiraTrabalho, dataContratacao, salario) values
(1, Caio, 1234, '02/10/2000', 1500 ),
(2, Artur, 4321, '26/01/1974', 1500),
(3, Renan,3453, '27/05/2017', 1500),
(4, Sofia,5767, '05/05/2014', 1500),
(5, Helena,6563, '03/07/2012', 3000),
(6, Pedro,6356, '15/08/2006', 3000),
(7, Maria,7664, '15/12/2013', 2500),
(8, Severino,7898, '12/04/2014',1800 ),
(9, Enzo, 8678, '07/10/2009', 1950),
(10, Piettro, 8768, '21/11/2018', 2740);


--inserindo valores na tabela função
insert into funcao(idfuncao, nome) values
(1, Atendente),
(2, Manutenção),
(3, Gerente),
(4, Marketing),
(5, Técnico Geral);

--inserindo valores na tabela horário
insert into horario(idhorario, horario) values
(1, '14:00'),
(2, '16:00'),
(3, '18:00'),
(4, '20:00'),
(5, '22:00');

--inserindo valores na tabela horario_trabalho_funcionario
insert into horario_trabalho_funcionario(horario_idhorario, funcionario_idfuncionario, funcao_idfuncao)
(1, 1, 1),
(1, 2, 1),
(2, 3, 2),
(2, 4, 2),
(3, 5, 3),
(3, 6, 3),
(4, 7, 4), 
(4, 8, 4),
(5, 9, 5),
(5, 10, 5);

--inserindo valores na tabela sala
insert into sala(idsala, nome, capacidade)values
(1, 'Sala 1', 50 ),
(2, 'Sala 2', 75),
(3, 'Sala 3', 30),
(4, 'Sala 4', 50),
(5, 'Sala 5', 50),
(6, 'Sala 6', 100),
(7, 'Sala 7', 75),
(8, 'Sala 8', 30); 

--inserindo valores na tabela filme_exibido_sala
insert into filme_exibido_sala(filme_idfilme, sala_idsala, horario_idhorario)values
(1, 1, 1),
(3, 3, 1),
(2, 5, 3),
(4, 4, 3),
(6, 7, 4),
(7, 6, 4),
(9, 8, 2),
(8, 4, 2),
(10,2, 5),
(5, 6, 5);


--inserindo valores na tabela premiacoes
insert into premiacao(idpremiacao, nome, ano)values
(1, 'MTV: Movie Award - Melhor dupla em cena', 2018),
(2, 'AMA', ),
(3, 'Oscar', 'Melhor Edição de Som', 2013),
(4, "Nickelodeon's Kid's Choice Awards", 2008),
(5, 'Teen Choice Awards', 2014),
(6, 'People Choice Award', 2020),
(7, 'People Choice Award: Melhor Filme de Drama', 2020);

--inserindo valores na tabela gênero
insert into genero(idgenero, nome)values
(1, 'Terror'), 
(2, 'Ação/Aventura'),
(3, 'Comédia'),
(4, 'Drama'),
(5, 'Fantasia/Ficção');

--inserindo valores na tabela diretor
insert into diretor(idDiretor, nome)values
(1,'Tim Hill'),
(2, 'Andy Muschietti'),
(3, 'Sam Mendes'),
(4, 'Dennis Dugan'),
(5, 'Joseph Kosinski'),
(6, 'Christopher Nolan'),
(7, 'Lasse Hallström'),
(8, 'Thea Sharrock');

--inserindo valores na tabela filme
insert into filme(idfilme, nomeBR, nomeEN, anoLancamento, diretor_idDiretor, sinopse, genero_idgenero)values
(1, 'Alvin e os Esquilos', 'Alvin and the Chimpmunks', 2007, 1,'Quando a árvore em que moram é derrubada e enviada para Los Angeles, os esquilos falantes Alvin, Simon e Theodore encontram um novo lar na casa do compositor Dave Seville (Antti Jaakola). Apesar de um início conturbado com a nova situação doméstica, Dave descobre que as criaturas travessas sabem cantar muito bem. Os esquilos assinam um contrato com uma gravadora e logo descobrem o preço da fama.', 2),
(2, 'IT: A coisa', 'IT: Chapter One', 2017, 2, 'Um grupo de crianças se une para investigar o misterioso desaparecimento de vários jovens em sua cidade. Eles descobrem que o culpado é Pennywise, um palhaço cruel que se alimenta de seus medos e cuja violência teve origem há vários séculos.', 1),
(3, '007: Operação Skyfall', '007: Skyfall', 2012, 3, 'Após uma missão mal sucedida de James Bond, a identidade de agentes secretos é revelada e o M16, atacado. Ajudado por um agente de campo, Bond deverá seguir a trilha de Silva, um homem que habita o passado de M e que tem contas a acertar.', 2),
(4, 'Gente Grande 2', 'Grown Ups 2', 2013, 4, 'Lenny Feder e sua família se mudam para sua cidade natal para ficar perto dos amigos, mas acabam tendo que enfrentar alguns fantasmas do passado, como a covardia diante de valentões e o famigerado bullying na escola.', 3),
(5, 'Top Gun: Maverick','Top Gun: Maverick', 2020, 5, 'Depois de mais de 30 anos de serviço como um dos principais aviadores da Marinha, Pete "Maverick" Mitchell está de volta, rompendo os limites como um piloto de testes corajoso. No mundo contemporâneo das guerras tecnológicas, Maverick enfrenta drones e prova que o fator humano ainda é essencial.', 2),
(6, 'Interestelar', 'Interstellar', 2014, 6, 'As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar.', 5),
(7, 'Sempre ao seu lado', "Hachi: A dog's tale", 2009, 7, 'Professor universitário encontra na estação de trem um filhote de cachorro da raça Akita, conhecida por sua lealdade. O cão passa a acompanhá-lo até a estação de trem e esperar sua volta. Até que um acontecimento inesperado altera sua vida.', 4),
(8, 'Como eu era antes de você', 'Me Before You', 2016, 8, 'A jovem e peculiar Louisa "Lou" Clark transita de emprego a emprego para ajudar a sustentar sua família. Entretanto, sua atitude alegre é testada quando se torna cuidadora de Will Traynor.', 4);

-- fazendo consulta dos funcionários com salario entre 1000 e 3000 reais
select * from funcionario
where salario between 1000 and 3000;

-- consulta 2
select f.nomeBR , p.nome from filme_has_premiacao fhp
inner join filme f
inner join premiacao p 
on fhp.premiacao_idpremiacao = p.idpremiacao and fhp.filme_idfilme = f.idfilme;

-- consulta 3 o nome do funcionario e o horario de trabalho e salario 
select f.nome, h.horario, f.salario from funcionario f
inner join horario h
inner join horario_trabalho_funcionario htf
on htf.horario_idhorario = h.idhorario and htf.funcionario_idfuncionario = f.idfuncionario;

-- consulta nome da sala , ano de lançamento do filme, para aquelas salas com capacidade maior q 50 
select sala.nome , filme.anoLancamento from filme_exibido_sala fes
inner join sala.nome s 
inner join filme.anoLancamento f on
fes.sala_idsala = s.idsala and f.anoLancamento where s.capacidade < 50;

-- criar visão, nome do funcionario, carteira de trabalho, data de contratação e sua função
create view vwfuncionario as 
select f.nome as nome_funcionario,
f.carteiraTrabalho,
f.dataContratacao,
fn.nome as funcao_trabalhador
from funcionario f
join funcao fn
join horario_trabalho_funcionario htf
on htf.funcao_idfuncao = fn.idfuncao and f.idfuncionario = htf.funcionario_idfuncionario

-- consulta data de contratação, horário de trabalho, para aqueles com salario menor que 5000
select f.dataContratacao, h.horario from funcionario f
inner join horario h
inner join horario_trabalho_funcionario htf
on htf.horario_idhorario = h.idhorario and htf.funcionario_idfuncionario = f.idfuncionario where f.salario < 5000;

-- consulta nome do diretor, gênero do filme e sinopse para aqueles com ano de lançamento de 2015,2016,2017,2020.
select d.nome, g.nome, f.sinopse from diretor d
join genero g
join filme f
on f.diretor_idDiretor = d.idDiretor and f.genero_idgenero = g.idgenero
where f.anoLancamento in(2015,2016,2017,2020);

-- capacidade da sala, nome do filme (en), ano de lançamento, para aqueles cujo nome em ptbr comecem em "B"
select nomeBR, anoLancamento, s.capacidade from filme f
join sala s 
join filme_exibido_sala fes
on fes.filme_idfilme = f.idfilme and s.idsala = fes.sala_idsala
where nomeBR like("%A");

-- valor total de gastos com salario dos funcionarios
select sum(salario) from funcionario;

-- quantidade de filmes por ano (group by)
select * from filme f group by anoLancamento;






