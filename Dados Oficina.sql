-- Dados da Oficina 
use Oficina;
-- Tabela clientes
-- idCliente, Cname, CPF, Address
insert into clientes ( idCliente, Cname, CPF, Address)
   Values ('1','Rafael neto',03598229593,'Teixeira de freitas'),
          ('2','Rita de cássia',15489653248,'Medeiros neto'),
          ('3','Maurisa rodrigues',45623478457,'Teixeira de freitas'),
          ('4','Cássia neto',89563214578,'Medeiros neto'),
          ('5','Daniel neto',87592145789,'Itamarajú');
         
          
          
-- Tabela Oficinas
-- idOficina, Location, Specialties, Address
-- Especialties = Enum 'Motor','Elétrica','Funilaria','Pintura','Borracharia'
insert into oficinas ( Location, Specialties, Address, Ordem_de_seviço_idOrdem, Ordem_de_serviço_Veículo_idVeiculo, 
Ordem_de_serviço_Veículo_Cliente_idCliente, Mecânicos_idMecânico )
    Values ('MG','Motor','Teofilo Antônio','1','2','3','4'),
		   ('SP','Eletrica','São Bernardo do campo','2','3','4','5'),
           ('BA','Borracharia', 'Teixeira de Freitas','3','4','5','1'),
           ('ES','Funilaria','Serra','4','5','1','2'),
           ('RJ','Borracharia', 'Rio de Janeiro','5','1','2','3');
           
           
update oficinas set Ordem_de_serviço_idOrdem = '5', Ordem_de_serviço_Veículo_idVeículo = '1',
Ordem_de_serviço_Veículo_Cliente_idCliente = '2', Mecânicos_idMecânico = '3'
where idOficina = '5';   
           
           
-- Tabela Mecanicos
-- idMecanic, MecName, MecSpecialtie
--  ENUM('Motor', 'Elétrica', 'Funilaria', 'Pintura', 'Borracharia')
insert into mecanicos (MecName, MecSpecialtie)
    Values ( 'Gelson Paixão','Borracharia'),
           ( 'Aleilton Paranaguá','Motor'),
           ( 'Rafael Novais','Elétrica'),
           ( 'Davi Santos','Funilaria'),
           ( 'Duarlis Oliveira','Pintura');
           
           
-- Tabela Ordem_de_Serviço
-- idOrdem, idMec, DataInicio, DataEntrega, ServRealizado, Statusdoserviço, Tipodeserviço, idVeiculo, idCliente, idMecanic
-- ENUM('Iniciado', 'Em andamento', 'Finalizado')
insert into Ordem_de_serviço (DataInicio, DataEntrega, ServRealizado, Statusdoserviço, idVeiculo, Cliente_idCliente, Mecânicos_idMecânico )
    Values (20200312,20200412,'troca de Óleo','Finalizado','1','2','4'),
           (20250307,20250512,'Revisão Geral','Iniciado','2','3','4'),
           (20250630,20250913,'Elétrica','Em andamento','3','1','3'),
           (20230512,20230711,'Funilaria','Iniciado','4','5','1'),
           (20210820,20210921,'Preventiva','Finalizado','5','4','2');
select * from Ordem_de_serviço;           
           
update Ordem_de_serviço set idVeiculo = '3', Cliente_idCliente = '1',
 Mecânicos_idMecânico = '3'
where idOrdem = '3';   


           
           
-- Tabela veiculo
-- idVeiculo, Modelo, Placa, Combustivel, Fabricante, AnoFabricacao, idcliente
insert into veiculo  ( Modelo, Placa, Combustivel, Fabricante, AnoFabricacao, Cliente_idCliente)
     values ('Strada','FPK4512','Gasolina','Fiat',2000,'1' ),
            ('Saveiro','GDE3256','Diesel','Volvo',2021,'2'),
            ('Uno','FDT4578','Alcool','Fiat',2023,'3'),
            ('C4','FRT4236','Gasolina','Citroem',2023,'4'),
            ('Panamera','GYT4821','Gasolina','Posche',2025,'5');
            
insert into veiculo  ( Cliente_idCliente)
   values (1,2,3,4,5);
            
            
-- Tabela garantia
-- idGarantia, SevRealizado, Datainicio, idCliente, idVeiculo
-- ENUM('Motor', 'Elétrica', 'Funilaria', 'Pintura', 'Borracharia')
insert into garantia ( ServRealizado, DataInicio, Cliente_idCliente, Veículo_idVeiculo)
	values ('Elétrica',20250212,'1','1'),
           ('Motor',20230624,'2','3'),
           ('Borracharia',20250812,'3','4'),
           ('Funilaria', 20210416,'1','4'),
           ('Pintura',20240309,'4','5');
           
 update garantia set Cliente_idCliente = '3', Veículo_idVeiculo = '1'
where idGatantia = '3';          

           
-- Tabela pagamento
-- idPayment, typePayment, idCliente
insert into pagamento (typePayment, cliente_idCliente)
    values ('Dinheiro','1'),
           ('Pix','2'),
           ('Cartão','3'),
           ('Dinheiro','4'),
           ('Dinheiro','5');
           
 update pagamento set cliente_idCliente = '5'
where idPayment = '5';
select * from pagamento ;
           


