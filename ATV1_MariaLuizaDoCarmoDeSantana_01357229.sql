
/*
01) Considerando a DATABASE disponível em 
https://github.com/DIOGOBRODRIGUES/DBP_3MA2021_1/blob/master/aula5.sql
Desenvolva uma função queinsere um novo aluno na tabela “Aluno” e retorne o nome do aluno Inserido.
*/

delimiter //
create function fn_adicionar_aluno (
	cod_curso INTEGER,
	dat_nasc DATE, 
	tot_cred INTEGER,	
	mgp DOUBLE,
	nom_alun VARCHAR (60), 
	email VARCHAR (30)) 
returns VARCHAR (60)
deterministic
begin
	insert into aluno(cod_curso,dat_nasc,tot_cred,mgp,nom_alun,email)
	values (cod_curso,dat_nasc,tot_cred,mgp,nom_alun,email);
return nom_alun ;
end// 
delimiter ; 

/*exemplo de utilização da função*/
select fn_adicionar_aluno (null, '2002-12-2', 60, 8.75, 'eduarda maria', 'eduarda@gmail.com')
as 'nom_alun' ;

/*
02) Desenvolva um procedimento em MYSQL que imprima a sequênciade 5 números utilizando a 
estrutura de repetição WHILE, saída esperada abaixo.
*/

delimiter **
create procedure sqc_numero ()
begin
	declare limite integer default 5;
	declare contador integer default 1;
    declare str varchar(60) default '1';
    while contador<limite do
		set contador = contador + 1 ;
		set str = concat(str, ',', contador );
	end while;
    select concat(str,',') as 'str' ;
end **
delimiter ;    

call sqc_numero();
            
/*03)Faça um procedimento em MYSQL que use a estrutura de repetição REPEAT para concatenar 
números de 1 a 9 (função concatenar em MySQL “CONCAT”);*/

delimiter |
create procedure sqc_numero_nove ()
begin
	declare contador integer default 1;
	declare limite integer default 9;
    declare result varchar(60) default '1';
    repeat 
		set contador = contador + 1 ;
		set result = concat(result, ',', contador );
	until contador >= limite
    end repeat;
	select concat(result,',') as 'result' ;
end |
delimiter ;    

call sqc_numero_nove();



            











