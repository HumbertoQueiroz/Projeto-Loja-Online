create schema LojaOnline;

create table tamanhos(
id int	unsigned not null auto_increment,
nomeTamanho varchar(2) not null,
primary key(id)
);

create table categoria(
id int	unsigned not null auto_increment,
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
tamanho int not null,
categoria int,
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

create table pedido(
id int	unsigned not null auto_increment,
PedidoCriadoEm date not null,
vendedor int,
valorVenda decimal(10,2),
formaPagamento int,
dataPagamento date,
cliente int,
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
produto int,
pedido int,
quantidadeProduto int,
primary key(id),
foreign key(produto)
	references produtos(id),
foreign key (pedido)
	references pedido(id)
);

create table clientes(
id int	unsigned not null auto_increment,
cpf varchar(11) not null unique,
nome varchar(255) not null,
ult_pedido int,
primary key (id) 
);



drop table categoria;
drop table pedido;
drop table formapagamento;
drop table produtos;
drop table tamanhos;
drop table vendedores;
drop table pedido_produtos;


