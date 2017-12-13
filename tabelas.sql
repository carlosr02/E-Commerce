create table Departamento(
	id int identity(1,1) not null,
	descricao varchar(50) not null,
	primary key(id)
)

create table Categoria(
	id int identity(1,1) not null,
	descricao varchar(50) not null,
	departamento_id int not null,
	primary key(id),
	foreign key(departamento_id) references Departamento(id)
)

create table Produto(
	id int identity(1,1) not null,
	nome varchar(50) not null,
	preco float not null,
	marca varchar(45) not null,
	qntEmEstoque int,
	mediaAvaliacoes float,
	descricao varchar(4000),
	emDestaque bit default 0,
	imagem_destaque varchar(2083) default '~/Imagens/produtos/destaque.png',
	categoria_id int not null,
	primary key(id),
	foreign key(categoria_id) references Categoria(id)	
)

create table Imagem(
	id int identity(1,1) not null,
	url varchar(2083) not null,
	destaque bit default 0,
	produto_id int not null,
	primary key(id),
	foreign key(produto_id) references Produto(id)
)

create table Usuario(
	id int identity(1,1) not null,
	email nvarchar(320) not null,
	senha varchar(32) not null,
	nome varchar(50),
	sexo char(1),
	dataNascimento date,
	cpf int,
	telefones varchar(30),
	endereco varchar(85),
	primary key(id)
)

create table Compra(
	id int identity(1,1) not null,
	total float not null,
	data date default getdate(),
	pago bit default 0,
	enderecoEntrega varchar(85) not null,
	usuario_id int not null,
	primary key(id),
	foreign key(usuario_id) references Usuario(id)
)

create table ItensCompra(
	id int identity(1,1) not null,
	quantidade int not null,
	precoParcial float not null,
	compra_id int not null,
	produto_id int not null,
	primary key(id),
	foreign key(compra_id) references Compra(id),
	foreign key(produto_id) references Produto(id)
)

create table AvaliacaoProduto(
	id int identity(1,1) not null,
	nota int not null,
	data date default getdate(),
	comentario nvarchar(4000),
	produto_id int not null,
	usuario_id int not null,
	primary key(id),
	foreign key(produto_id) references Produto(id),
	foreign key(usuario_id) references Usuario(id)
)


select * from Produto
select * from Imagem