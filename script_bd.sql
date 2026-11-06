
drop table usuario;
create table public.usuario(
  id_usuario serial primary key,
  nome                varchar(255) not null,
  email               varchar(255) null,
  senha_hash          varchar(255),
  data_nascimento     date,
  tipo_perfil         varchar(255),
  data_cadastro       timestamp
);


drop table jornalista;
create table public.jornalista(
  id_jornalista serial primary key,
  FK_usuario                 varchar(255) not null,
  registro_profissional      varchar(255) null,
  biografia                  character varying(255),
  especialidade              varchar(255) null
);


drop table comentario;
create table public.comentario(
  id_noticia serial primary key,
  registro_profissional   varchar(255) not null,
  biografia               varchar(255) null,
  entrevista              character varying(255),
  especialidade           varchar(255) null,
  fk_noticia              int
);


drop table noticia;
create table public.noticia (
  id_noticias serial primary key,
  titulo               varchar(255) not null,
  subtitulo            varchar(255) not null,
  conteudo_texto       text not null,
  status               varchar(255) not null,
  id_jornalista        bigint not null,
  id_categoria         bigint not null,
  data_publicação      timestamp,
  data_criação         timestamp
);


drop table historico_revisao;
create table public.historico_revisao(
  id_historico serial primary key,
  id_noticia              bigint not null,
  id_editor               bigint not null,
  observação_revisão      text not null,
  status_aplicado         varchar(255) not null,
  data_alteração          timestamp,
  fk_noticia              int
);


drop table midia_noticia;
create table public.midia_noticia(
  id_midia serial primary key,
  id_noticia              bigint not null,
  tipo_midia              varchar(255) not null,
  url_arquivo             varchar(255) not null,
  legenda                 varchar(255),
  data_upload             timestamp,
  fk_noticia              int

);


drop table noticia_tag;
create table public.noticia_tag(
  id_noticia serial primary key,
  id_tag              bigint not null,
  fk_noticia              int
);


drop table curtida_noticia;
create table public.curtida_noticia(
  id_curtida serial primary key,
  id_noticia              bigint not null,
  id_usuario              bigint not null,
  data_reação             timestamp,
  fk_noticia              int,
  fk_usuario              int
);


drop table categoria;
create table public.categoria(
  id_categoria serial primary key,
  nome_categoria              varchar (255) not null,
  descrição                   varchar (255) not null,
  slug                        varchar (255) not null
);

drop table tag;
create table public.tag(
  id_tag serial primary key,
  nome_tag              varchar not null
);
