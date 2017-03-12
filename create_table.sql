
drop table if exists sentirus.bank_train_2016;

create table sentirus.bank_train_2016 (
   id bigserial not null,
   twitid numeric(32) NOT NULL DEFAULT '0',
   date character varying (128) DEFAULT NULL,
   text character varying (256) DEFAULT NULL,
   sberbank integer DEFAULT NULL,
   vtb integer DEFAULT NULL,
   gazprom integer DEFAULT NULL,
   alfabank integer DEFAULT NULL,
   bankmoskvy integer DEFAULT NULL,
   raiffeisen integer DEFAULT NULL,
   uralsib integer DEFAULT NULL,
   rshb integer DEFAULT NULL,
   PRIMARY KEY (id)
);
  
