create or replace function 
	add_teacher ( the_first_name text, the_last_name text, the_email text )
	returns boolean as
$$
declare
-- declare a variable to be used in the function
total int;

begin

	-- run a query to check if the email name exists
	select into total count(*) from teacher 
		where LOWER(email)= LOWER(the_email);

	-- if total is 0 the email doesn't exist
	if (total = 0) then
		-- then create the teacher
    	insert into teacher (first_name, last_name, email) values (the_first_name, the_last_name, the_email);
      -- insert into teacher (last_name) values (the_last_name);
		  -- insert into teacher (email) values (the_email);
		-- and returns true if the subject was created already
		return true;
	else
		-- returns false if the email already exists
		return false;
	end if;

end;
$$
Language plpgsql;