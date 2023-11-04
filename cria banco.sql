create schema LojaOnline;

create table tamanhos(
id int not null auto_increment,
nomeTamanho varchar(2) not null,
primary key(id)
);

create table categoria(
id int not null auto_increment,
nomeCategoria varchar(30) not null,
primary key(id) 
);

create table formaPagamento(
id int not null auto_increment,
NomePagamento varchar(30) not null,
primary key(id)
);

create table produtos(
id int not null auto_increment,
tamanho int not null,
categoria int,
quantidade int not null,
descricao varchar(30) not null,
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
id int not null auto_increment,
nome varchar(30) not null,
comissao int,
primary key(id)
);

create table pedido(
id int not null auto_increment,
dataPedido date not null,
vendedor int,
valorVenda decimal(10,2),
formaPagamento int,
dataPagamento date,
primary key(id),
foreign key(vendedor)
	references vendedores(id),
foreign key(formaPagamento)
	references formaPagamento(id)
);

create table Pedido_Produtos(
id int not null auto_increment,
produto int,
pedido int,
quantidadeProduto int,
primary key(id),
foreign key(produto)
	references produtos(id),
foreign key (pedido)
	references pedido(id)
);
drop table categoria;
drop table pedido;
drop table formapagamento;
drop table produtos;
drop table tamanhos;
drop table vendedores;
drop table pedido_produtos;


