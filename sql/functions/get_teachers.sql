create or replace function
get_teachers()
returns table (
teachers teacher_type
)
 language plpgsql
AS

$$
begin
return QUERY
select 
	"teacher".id, 
	"teacher".last_name,
  "teacher".first_name,
  "teacher".email
from teacher;

end;
$$
