-- consultas apartir dos dados inseridos no projeto Oficinas

-- Consultas usando SELECT statement:

use oficina;
select * from clientes ;

SELECT Cname, CPF FROM clientes ;

select * from clientes 
where Address = 'teixeira de freitas' ;

select * from ordem_de_serviço , veiculo
where Statusdoserviço = 'finalizado' 
order by DataInicio asc;

SELECT c.Cname, g.idGatantia
FROM clientes c
INNER JOIN garantia g
ON c.idCliente = g.idGatantia;





