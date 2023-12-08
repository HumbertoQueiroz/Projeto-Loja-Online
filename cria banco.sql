create schema LojaOnline;

create table tamanhos(
id int unsigned not null auto_increment,
nomeTamanho varchar(2) not null,
primary key(id)
);

create table categoria(
id int unsigned	not null auto_increment,
nomeCategoria varchar(255) not null,
primary key(id) 
);

create table formaPagamento(
id int	unsigned not null auto_increment,
NomePagamento varchar(255) not null,
primary key(id)
);

create table produtos(
id int	unsigned not null auto_increment,
tamanho int unsigned,
categoria int unsigned,
quantidade int not null,
descricao varchar(255) not null,
CodBarras varchar(15),
VlCompra decimal(10,2),
VlVenda decimal(10,2),
primary key (id),
foreign key (tamanho)
	references  tamanhos(id),
foreign key (categoria)
	references categoria(id)
);

create table vendedores(
id int	unsigned not null auto_increment,
nome varchar(255) not null,
comissao int,
primary key(id)
);

create table clientes(
id int	unsigned not null auto_increment,
cpf varchar(11) not null unique,
nome varchar(255) not null,
ult_pedido int,
primary key (id) 
);

create table pedido(
id int	unsigned not null auto_increment,
PedidoCriadoEm date not null,
vendedor int unsigned,
valorVenda decimal(10,2),
formaPagamento int unsigned,
dataPagamento date,
cliente int unsigned,
primary key(id),
foreign key(vendedor)
	references vendedores(id),
foreign key(formaPagamento)
	references formaPagamento(id),
foreign key(cliente)
	references clientes(id)
);

create table Pedido_Produtos(
id int	unsigned not null auto_increment,
produto int unsigned,
pedido int unsigned,
quantidadeProduto int,
primary key(id),
foreign key(produto)
	references produtos(id),
foreign key (pedido)
	references pedido(id)
);


INSERT INTO tamanhos (nomeTamanho) VALUES
('P'),
('M'),
('G'),
('GG'),
('36'),
('38'),
('40'),
('42'),
('44'),
('46');


INSERT INTO categoria (nomeCategoria) VALUES
('Camisetas'),
('Calças'),
('Sapatos'),
('Acessórios'),
('Vestidos'),
('Casacos'),
('Bermudas'),
('Saias'),
('Blusas'),
('Moletons');

INSERT INTO formaPagamento (NomePagamento) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('Dinheiro'),
('Transferência Bancária'),
('Boleto Bancário'),
('Pix'),
('Cheque'),
('Vale-Alimentação'),
('Vale-Refeição'),
('PayPal');

INSERT INTO vendedores (nome, comissao) VALUES
('João Silva', 5),
('Maria Santos', 7),
('Pedro Oliveira', 6),
('Ana Souza', 8),
('Carlos Fernandes', 5),
('Julia Costa', 7),
('Luiz Rodrigues', 6),
('Fernanda Martins', 8),
('Rafaela Almeida', 5),
('Gustavo Pereira', 7);

INSERT INTO clientes (cpf, nome, ult_pedido) VALUES
('12345678901', 'Fulano Silva', 101),
('23456789012', 'Ciclano Oliveira', 102),
('34567890123', 'Beltrano Santos', 103),
('45678901234', 'José Costa', 104),
('56789012345', 'Maria Pereira', 105),
('67890123456', 'Ana Souza', 106),
('78901234567', 'Joana Martins', 107),
('89012345678', 'Pedro Fernandes', 108),
('90123456789', 'Carla Almeida', 109),
('01234567890', 'Gustavo Ribeiro', 110);

INSERT INTO produtos (tamanho, categoria, quantidade, descricao, CodBarras, VlCompra, VlVenda) VALUES
(1, 1, 50, 'Camiseta branca básica', '123456789012', 15.00, 25.00),
(2, 2, 30, 'Calça jeans skinny', '234567890123', 30.00, 50.00),
(3, 3, 20, 'Tênis esportivo', '345678901234', 40.00, 70.00),
(4, 4, 40, 'Óculos de sol', '456789012345', 10.00, 20.00),
(5, 5, 15, 'Vestido estampado', '567890123456', 35.00, 60.00),
(6, 6, 25, 'Jaqueta de couro', '678901234567', 50.00, 90.00),
(7, 7, 45, 'Bermuda jeans', '789012345678', 20.00, 35.00),
(8, 8, 60, 'Saia midi', '890123456789', 25.00, 45.00),
(9, 9, 55, 'Blusa de tricô', '901234567890', 30.00, 55.00),
(10, 10, 35, 'Moletom canguru', '012345678901', 40.00, 70.00);

INSERT INTO pedido (PedidoCriadoEm, vendedor, valorVenda, formaPagamento, dataPagamento, cliente) VALUES
('2023-01-15', 1, 150.00, 1, '2023-01-20', 1),
('2023-02-20', 2, 200.00, 2, '2023-02-25', 2),
('2023-03-10', 3, 300.00, 3, '2023-03-15', 3),
('2023-04-05', 4, 180.00, 4, '2023-04-10', 4),
('2023-05-18', 5, 250.00, 5, '2023-05-23', 5),
('2023-06-22', 6, 350.00, 6, '2023-06-27', 6),
('2023-07-14', 7, 190.00, 7, '2023-07-19', 7),
('2023-08-30', 8, 280.00, 8, '2023-09-04', 8),
('2023-09-05', 9, 220.00, 9, '2023-09-10', 9),
('2023-10-12', 10, 270.00, 10, '2023-10-17', 10);

INSERT INTO LojaOnline.Pedido_Produtos (produto, pedido, quantidadeProduto) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1),
(6, 6, 2),
(7, 7, 3),
(8, 8, 1),
(9, 9, 2),
(10, 10, 1);


select * from tamanhos;

select * from categoria;

select * from formaPagamento;

select * from produtos p, tamanhos t where p.tamanho=t.id;

select * from vendedores;

select * from clientes;

select * from pedido;

select * from Pedido_Produtos;





drop table categoria;
drop table pedido;
drop table formapagamento;
drop table produtos;
drop table tamanhos;
drop table vendedores;
drop table pedido_produtos;




drop schema lojaonline;


