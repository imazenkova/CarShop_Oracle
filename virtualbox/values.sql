begin
kurs.AddSupplier('VOLKSWAGEN AUTO GROUP','Germany','+81496931234');
commit;
end;
/

begin
kurs.AddSupplier('HAVAL','CHINA','+81496931235');
commit;
end;
/

begin
kurs.AddSupplier('BMW','Germany','+81496931732');
commit;
end;
/

begin
kurs.AddSupplier('DAIMLER','Germany','+8145838272');
commit;
end;
/


begin
kurs.AddSupplier('HYUNDAI','The Republic of Korea','+32269375937');
commit;
end;
/


begin
kurs.AddSupplier('TOYOTA MOTOR', 'Japan','+144486091100');
commit;
end;
/


begin
kurs.AddSupplier('HONDA','Japan','+14412394665');
commit;
end;
/


begin
kurs.AddSupplier('GROUPE PSA','France','+4937658261');
commit;
end;
/


begin
kurs.AddSupplier('GENERAL MOTORS','USA','+22358278273' );
commit;
end;
/


begin
kurs.AddSupplier('FORD','USA','+2234363572');
commit;
end;
/


begin
kurs.AddSupplier('FIAT','Italy', '+6333238382' );
commit;
end;
/



-- select * from KURS.supplier;

begin
kurs.AddEquipment('Mechanical','Hatchback', 'Component' );
commit;
end;
/
begin
kurs.AddEquipment('Hydromechanical','Liftback', 'Component' );
commit;
end;
/
begin
kurs.AddEquipment('Hydraulic','Crossove', 'Coaxial' );
commit;
end;
/
begin
kurs.AddEquipment('Electromechanical','Pickup', 'Coaxial' );
commit;
end;

begin
kurs.AddEquipment('Mechanical','Targa', 'Coaxial' );
commit;
end;
/
begin
kurs.AddEquipment('Hydromechanical','Coup', 'Coaxial' );
commit;
end;
/

begin
kurs.AddEquipment('Hydraulic','Van', 'Component' );
commit;
end;
/
begin
kurs.AddEquipment('Electromechanical','Roadster', 'Component' );
commit;
end;
/
begin
kurs.AddEquipment('Electromechanical','Roadster', 'Component' );
commit;
end;

---- select * from KURS.Equipment;

begin
kurs.AddModel('Diesels', 4, 3100, 200);
commit;
end;

/
begin
kurs.AddModel('Rotary', 6, 4000, 400);
commit;
end;
/
begin
kurs.AddModel('VR', 2, 2500, 100);
commit;
end;
/
begin
kurs.AddModel('Boxer', 4, 3800, 350);
commit;
end;
/

--select * from Model;

begin
kurs.AddCar(6, 1, 9, 'Honda','Red',30000,  1);
commit;
end;
/
begin
kurs.AddCar(5, 4, 8, 'Toyota','Black',25000,  1);
commit;
end;
/
begin
kurs.AddCar(9, 2, 6, 'Ford','White',20000,  1);
commit;
end;
/
begin
kurs.AddCar(10, 3, 4, 'Fiat','Green',23000, 1);
commit;
end;
/

begin
kurs.AddCar(2, 1, 3, 'BMW','Red', 45000,  1);
commit;
end;
/
begin
kurs.AddCar(1, 4, 5, 'Volkswagen','Yellow',35000, 1);
commit;
end;
/
begin
kurs.AddCar(4, 2, 2, 'Hyundai','Black',18000, 1);
commit;
end;
/
begin
kurs.AddCar(5, 3, 7, 'Toyota','Red',27000, 1);
commit;
end;
/
begin
kurs.AddCar(9, 2, 1, 'Ford','Green',36000,  1);
commit;
end;
/


begin
kurs.DELETESUPPLIER(21);
commit;
end;
/

--select * from cars;


begin
kurs.AddAdmin(1, 'admin', 'admin', 'adminovich', '+375296837410', 'admin');
commit;
end;
/

--select * from admin;

declare a int;
begin
kurs.AddClient('Ivan','Ivanov','Ivanovich', 'Minsk', 20, '+375332945681', a);
commit;
end;
/

--select*from clients;


begin
kurs.AddAccout(1,'IVANOV2022','Password2022');
commit;
end;

--select*from accounts;

-----noy done
begin
kurs.AddOrder(1,5);
commit;
end;

--select * from orders;



begin
kurs.DeleteOrder(1);
commit;
end;

