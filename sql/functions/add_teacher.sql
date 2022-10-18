create or replace function 
	add_teacher ( the_first_name text, the_last_name text, the_email text )
	returns text as
$$
declare

total int;

begin
	
	select into total count(*) from teacher 
		where LOWER(email)= LOWER(the_email);


	if (total = 0) then
    	insert into teacher (first_name, last_name, email) values (the_first_name, the_last_name, the_email);

			return 'Teacher is added in the database' ;
 
	else
	
		return 'Teacher is already in the database';
	end if;

end;
$$
Language plpgsql;