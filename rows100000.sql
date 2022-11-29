set timing on serveroutput on

begin
FOR Lcntr IN 1..100000
LOOP
   AddSupplier('testing','100000', 'rows' );
END LOOP;
end;


select * from equipment;

select * FROM Supplier where id = 100000 ;
