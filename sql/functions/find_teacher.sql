create or replace function find_teacher ()
	returns table (
	id int,
	first_name text
	) as
$$
begin

return query
	select 
		"teacher".id, 
		"teacher".first_name
	from teacher;

end;
$$
Language plpgsql;