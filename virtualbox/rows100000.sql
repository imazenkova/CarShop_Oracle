set timing on serveroutput on

begin
FOR Lcntr IN 1..100000
LOOP
   AddSupplier('testing','100000', 'rows' );
END LOOP;
end;


select count(*) from Supplier;
select * from Supplier where adress='USA';

commit;



declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from Supplier where id > 5000 and id < 7000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

CREATE INDEX supplier_id ON supplier(id, adress);



declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from equipment where id > 5000 and id < 7000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

drop INDEX supplier_id ;


select * FROM equipment;