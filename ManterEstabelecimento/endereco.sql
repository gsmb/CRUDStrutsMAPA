CREATE TABLE endereco
(
endereco_id serial NOT NULL,
 endereco_cep integer,
  endereco_rua character(100),
  endereco_bairro character(50),
  endereco_cidade character(50),
  endereco_uf character(2),
  endereco_ibge character(15),
  CONSTRAINT endereco_pkey PRIMARY KEY (endereco_id)
  );
  select * from endereco;
  