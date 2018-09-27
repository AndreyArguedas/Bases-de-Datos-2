select d.provincia, count(p.cedula) from padron p, distritos d where d.codigo = p.codelect group by d.provincia order by d.provincia;


--Minima

CREATE INDEX padron_ced_idx ON padron(cedula) TABLESPACE padron_indices; 

CREATE INDEX padron_cod_idx ON distritos(codigo) TABLESPACE padron_indices; 

--Intermedia 1pk, 1idx

--OPTIMAL
-- 1pk, 1 idx, 1fk

drop index padron_codelect_idx;

alter table distritos drop constraint dist_pk; 

alter table padron drop constraint padron_fk1;

alter table distritos ADD constraint dist_pk primary key (codigo) using index tablespace indices;

CREATE INDEX padron_codelect_idx ON padron(codelect) tablespace indices;

alter table padron add constraint padron_fk1 foreign key (codelect) references distritos;