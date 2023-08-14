create database ibge_lspa;
use ibge_lspa;

create table produtos (
cod_produto int,
nome_produto varchar(45),
primary key(cod_produto)
);

create table safra ( 
cod_safra int,
cod_produto int, 
volume int,
ano int, 
mes int,
foreign key (cod_produto) references produtos (cod_produto),
primary key(cod_safra)
);


#listar todos os produtos e suas safras correspondentes
 SELECT p.cod_produto, p.nome_produto, s.cod_safra, s.volume, s.ano, s.mes
FROM produtos p
INNER JOIN safra s ON p.cod_produto = s.cod_produto;

#Listar o nome do produto, volume e ano da safra para um produto específico (por exemplo, código do produto 1)
SELECT p.nome_produto, s.ano, s.volume
from produtos p 
inner join safra s on p.cod_produto = s.cod_produto
where p.cod_produto = 1;

#Calcular o volume total de safras para cada produto
select p.nome_produto, sum(volume) as volume_total from safra s 
inner join produtos p on p.cod_produto = s.cod_produto  
group by p.nome_produto;


#Listar os produtos que tiveram safras no ano de 2023
select p.nome_produto as produto_2023
from produtos p 
inner join safra s on p.cod_produto = s.cod_produto 
where s.ano = 2023;


#Listar o nome do produto e o volume médio das safras para produtos com volume médio superior a 100 milhões de toneladas
select p.nome_produto, avg(s.volume) as volume_medio
from produtos p 
inner join safra s on p.cod_produto = s.cod_produto 
group by p.nome_produto
having avg(s.volume) > 100000000;

#Listar os produtos e suas safras ordenados pelo ano e mês da safra
select p.nome_produto, s.cod_safra , s.ano
from produtos p 
inner join safra s on p.cod_produto = s.cod_produto 
order by s.ano , s.mes;

#Listar os produtos que tiveram safras no ano de 2023
select p.nome_produto, s.cod_safra, s.ano
from produtos p 
inner join safra s on p.cod_produto = s.cod_produto 
where s.ano = 2023;


#Listar o nome do produto e o volume médio das safras para produtos com volume médio superior a 100 milhões de toneladas
select p.nome_produto, avg(s.volume) as volume_medio 
from produtos p 
inner join safra s on p.cod_produto = s.cod_produto 
group by p.nome_produto 
having volume_medio > 100000000;



#Calcular o total de volume de safras agrupados por produtos no ano de 2023
select sum(s.volume) 
from produtos p 
inner join safra s on p.cod_produto = s.cod_produto 
group by s.ano = 2023;


#Calcular volume de safras do produto com código 2 no ano de 2023 no mês de Junho
select sum(s.volume), s.cod_produto
from produtos p 
inner join safra s on p.cod_produto = s.cod_produto 
where s.cod_produto  = 2 and s.ano = 2023 and s.mes = 6;


SELECT * FROM produtos p INNER JOIN safra s ON p.cod_produto =
s.cod_produto;






 

