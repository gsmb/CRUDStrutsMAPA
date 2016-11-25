CREATE TABLE estabelecimento
(
  id serial NOT NULL,
  estabelecimento_codigo character(50),
  estabelecimento_situacao character(50),
  estabelecimento_descricao character(50),
  estabelecimento_cep integer,
  estabelecimento_rua character(100),
  estabelecimento_bairro character(50),
  estabelecimento_cidade character(50)[],
  estabelecimento_uf character(2),
  estabelecimento_ibge character(15),
  CONSTRAINT estabelecimento_pkey PRIMARY KEY (id)
)
drop table estabelecimento