set timing on serveroutput on

begin
FOR Lcntr IN 1..100000
LOOP
   AddEquipment('testing','100000','rows');
END LOOP;
end;


select * from equipment;


CREATE INDEX equipment_id ON equipment(id, salon);


declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from equipment where id > 5000 and id < 7000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

drop INDEX equipment_id ;


select * FROM equipment;
