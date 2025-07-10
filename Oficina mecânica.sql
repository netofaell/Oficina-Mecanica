-- Desafio de projeto Garantia de oficina mecânica

desc Oficinas;
create database Oficina;
use Oficina;
 

create table Oficinas (
idOficina int auto_increment primary key,
Location varchar (45) not null,
Specialties ENUM('Motor','Elétrica','Funilaria','Pintura','Borracharia') not null default ('Serviço não informado'),
Address varchar (255),
Ordem_de_serviço_idOrdem int,
Ordem_de_serviço_Veículo_idVeículo int,
Ordem_de_serviço_Veículo_Cliente_idCliente int,
Mecânicos_idMecânico int
);

ALTER TABLE Oficinas ADD (
constraint Fk_Oficinas_Ordem_de_serviço foreign key (Ordem_de_serviço_idOrdem ) references Ordem_de_serviço (idOrdem),
constraint Fk_Oficinas_Ordem_de_serviço_Veiculo foreign key (Ordem_de_serviço_Veículo_idVeículo) references Veiculo (idVeiculo),
constraint Fk_Oficinas_Ordem_de_serviço_Veiculo_Cliente foreign key (Ordem_de_serviço_Veículo_Cliente_idCliente) references Clientes (idCliente));

ALTER TABLE Oficinas ADD (
constraint Fk_Oficinas_mecanico foreign key (Mecânicos_idMecânico ) references mecanicos (idMecanic));

create table Clientes (
idCliente int primary key auto_increment,
Cname varchar (45) not null,
CPF char (11) not null,
Address varchar (255) not null,
constraint unique_Clientes unique (CPF));


alter table mecanicos drop Oficinas_idOficina;
create table mecanicos (
idMecanic int auto_increment primary key,
MecName varchar (45) not null,
MecSpecialtie varchar (45) not null );


create table pagamento(
idPayment int auto_increment primary key,
typePayment ENUM ('Dinheiro','Pix','Cartão') not null default ('Pagamento Não informado'),
cliente_idCliente int);

alter table pagamento add (
constraint FK_Pagamento_Cliente foreign key (cliente_idCliente) references clientes (idCliente)
);

drop table Garantia;
create table Garantia(
idGatantia int auto_increment primary key,
ServRealizado ENUM('Motor', 'Elétrica', 'Funilaria', 'Pintura', 'Borracharia') not null ,
DataInicio date,
Cliente_idCliente int,
Veículo_idVeiculo int
);
alter table garantia add (
constraint FK_Garantia_Cliente foreign key (Cliente_idCliente) references Clientes (idCliente),
constraint FK_Garantia_Veiculo foreign key (Veículo_idVeiculo) references veiculo (idVeiculo)
);


alter table Veiculo drop column Veiculo_Cliente_idCliente ;

create table Veiculo(
idVeiculo int auto_increment primary key,
Modelo varchar (45) not null,
Placa char (7) not null,
Combustivel varchar (10) not null,
Fabricante varchar (45) not null,
AnoFabricacao char (4) not null,
Cliente_idCliente int,
constraint unique_veiculo unique (Placa));

alter table Veiculo add (
constraint Fk_Veiculo_Cliente foreign key (Cliente_idCliente) references Clientes (idCliente)
);

alter table Ordem_de_serviço drop idMec   ;
create table Ordem_de_serviço(
idOrdem int auto_increment primary key,
DataInicio date not null,
DataEntrega date not null,
ServRealizado varchar (45) not null,
Statusdoserviço ENUM('Iniciado','Em andamento','Finalizado') not null ,
idVeiculo int,
Cliente_idCliente int,
Mecânicos_idMecânico int,
constraint unique_Ordem_de_serviço unique (idMec));

alter table Ordem_de_serviço add (
constraint Fk_Ordem_de_serviço_Veiculo foreign key (idVeiculo) references Veiculo (idVeiculo),
constraint Fk_Ordem_de_serviço_Veiculo_Cliente foreign key (Cliente_idCliente) references Veiculo (Cliente_idCliente)
);
alter table Ordem_de_serviço add (
constraint Fk_Ordem_de_serviço_Mecanico foreign key (Mecânicos_idMecânico) references mecanicos (idMecanic));


