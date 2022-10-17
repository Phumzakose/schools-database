create or replace function 
	add_teacher (the_last_name text )
	returns boolean as
$$
declare

total int;

begin


	select into total count(*) from teachers 
		where LOWER(last_name) = LOWER(the_first_name);


	if (total = 0) then
	
		insert into teacher (last_name) values (the_last_name);
	
		return true;
	else
		
		return false;
	end if;

end;
$$
Language plpgsql;







