create or replace function 
get_subjects(the_name text)
returns TABLE(
subject text,
teacher text

)AS

$$
declare
  myrow record;

begin 

  FOR myrow in (select 
   subject.name, teacher.first_name
  from teacher
    join teacher_subject on teacher.id = teacher_subject.teacher_id
    join subject on teacher_subject.subject_id = subject.id

  group by 
   teacher.first_name, teacher.last_name, teacher.email, subject.name
having teacher.first_name = the_name)
  loop
    subject := myrow.name;
    teacher := myrow.first_name;
    return next;
  end loop;

end;
$$
Language plpgsql;