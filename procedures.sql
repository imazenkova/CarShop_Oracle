 
 -----------
 --сделать отмену заказа
 
 ----------------
 
create or replace procedure AddCar(p_supplier_id cars.supplier_id%type, p_model_id cars.model_id%type, p_equipment_id cars.equipment_id%type, p_brand cars.brand%type, p_color cars.color%type, p_cost cars.cost%type, p_sale_availability cars.sale_availability%type)
is
begin
    insert into cars(supplier_id, model_id, equipment_id, brand, color, cost ,sale_availability) 
    VALUES(p_supplier_id, p_model_id, p_equipment_id, p_brand, p_color, p_cost,  p_sale_availability);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

/






create or replace procedure DeleteCar(p_id cars.id%type)
is
begin
    delete from cars where cars.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/



create or replace procedure UpdateCar(p_id cars.id%type, p_supplier_id cars.supplier_id%type, p_model_id cars.model_id%type, p_equipment_id cars.equipment_id%type, p_brand cars.brand%type, p_color cars.color%type, p_cost cars.cost%type, p_sale_availability cars.sale_availability%type)
is
begin
    update cars set id = p_id, supplier_id = p_supplier_id, model_id = p_model_id, equipment_id = p_equipment_id, brand = p_brand, color = p_color, cost = p_cost, sale_availability = p_sale_availability  where cars.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

/


create or replace procedure AddEquipment(p_transmission equipment.transmission%type, p_salon equipment.salon%type, p_stereo_system equipment.stereo_system%type)
is
begin
    insert into equipment(transmission, salon, stereo_system) 
    VALUES(p_transmission, p_salon, p_stereo_system);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/


create or replace procedure DeleteEquipment(p_id equipment.id%type)
is
begin
    delete from equipment where equipment.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

/


create or replace procedure UpdateEquipment(p_id equipment.id%type, p_transmission equipment.transmission%type, p_salon equipment.salon%type, p_stereo_system equipment.stereo_system%type)
is
begin
    update equipment set id = p_id, transmission = p_transmission, salon = p_salon, stereo_system = p_stereo_system where equipment.id = p_id ;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


/



create or replace procedure AddSupplier(p_сompany_name supplier.сompany_name%type, p_adress supplier.adress%type, p_phone_number supplier.phone_number%type)
is
begin
    insert into supplier(сompany_name, adress, phone_number) 
    VALUES(p_сompany_name, p_adress, p_phone_number);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/


create or replace procedure DeleteSupplier(p_id supplier.id%type)
is
begin
    delete from supplier where supplier.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/

create or replace procedure UpdateSupplier(p_id supplier.id%type, p_сompany_name supplier.сompany_name%type, p_adress supplier.adress%type, p_phone_number supplier.phone_number%type)
is
begin
    update supplier set id = p_id, сompany_name = p_сompany_name, adress = p_adress, phone_number = p_phone_number where supplier.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/

create or replace procedure AddModel(p_engine_type model.engine_type%type, p_seats_number model.seats_number%type, p_weight model.weight%type, p_trunk_volume model.trunk_volume%type)
is
begin
    insert into model(engine_type, seats_number, weight, trunk_volume) 
    VALUES(p_engine_type, p_seats_number, p_weight, p_trunk_volume);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/

create or replace procedure DeleteModel(p_id model.id%type)
is
begin
    delete from Model where Model.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/

create or replace procedure UpdateModel(p_id model.id%type, p_engine_type model.engine_type%type, p_seats_number model.seats_number%type, p_weight model.weight%type, p_trunk_volume model.trunk_volume%type)
is
begin
    update model set id = p_id, engine_type = p_engine_type, seats_number = p_seats_number, weight = p_weight, trunk_volume = p_trunk_volume  where model.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/ 


create or replace procedure AddOrder(p_worker_id orders.worker_id%type, p_client_id orders.client_id%type, p_ordering_date orders.ordering_date%type,p_car_id orders.car_id%type)
is
begin
    insert into orders(worker_id, client_id, ordering_date, car_id) 
    VALUES(p_worker_id, p_client_id,  p_ordering_date, p_car_id);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/   

 create or replace procedure DeleteOrder(p_id orders.order_number%type)
is
begin
    delete from orders where orders.order_number = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;  
 /  
 
 create or replace procedure UpdateOrder(p_id orders.order_number%type, p_worker_id orders.worker_id%type, p_client_id orders.client_id%type, p_ordering_date orders.ordering_date%type)
is
begin
    update orders set order_number = p_id, worker_id = p_worker_id, client_id = p_client_id, ordering_date = p_ordering_date where orders.order_number = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/



create or replace procedure AddClient(p_name clients.name%type, p_surname clients.surname%type, p_patronymic clients.patronymic%type,p_adress clients.adress%type,p_age clients.age%type,p_phone_number clients.phone_number%type, new_id out clients.id%type)
 
is 
p_adress_encrypted  clients.adress%type; 
p_phone_number_encrypted clients.phone_number%type;

begin
    p_adress_encrypted := encode(p_adress, 'superkey12345678');
    p_phone_number_encrypted := encode(p_phone_number, 'superkey12345678');
    
    insert into clients(name, surname ,patronymic, adress, age, phone_number) 
    VALUES(p_name, p_surname,  p_patronymic, p_adress_encrypted, p_age, p_phone_number_encrypted);
    new_id := CLIENTS_ID_SEQ.CURRVAL;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/


 create or replace procedure DeleteClient(p_id clients.id%type)
is
begin
    delete from clients where clients.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;  
/
 create or replace procedure UpdateClient(p_id clients.id%type, p_name clients.name%type, p_surname clients.surname%type, p_age clients.age%type, p_phone_number clients.phone_number%type)
is
begin
    update clients set  name = p_name, surname = p_surname, age= p_age, phone_number= p_phone_number where clients.id = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/



create or replace procedure AddWorker(p_personnel_number workers.personnel_number%type, p_name workers.name%type,p_surname workers.surname%type,p_patronymic workers.patronymic%type,p_phone_number workers.phone_number%type, p_password_value workers.password_value%type)
is
begin
    insert into workers(personnel_number,name, surname, patronymic, phone_number, password_value) 
    VALUES(p_personnel_number,  p_name, p_surname, p_patronymic, p_phone_number, p_password_value);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/

 create or replace procedure DeleteWorker(p_id workers.personnel_number%type)
is
begin
    delete from workers where workers.personnel_number = p_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;  
/

 create or replace procedure UpdateWorker(p_personnel_number workers.personnel_number%type, p_name workers.name%type,p_surname workers.surname%type,p_patronymic workers.patronymic%type,p_phone_number workers.phone_number%type, p_password_value workers.password_value%type)
is
begin
    update workers set personnel_number = p_personnel_number, name = p_name, surname = p_surname, patronymic= p_patronymic, phone_number= p_phone_number, password_value=  p_password_value where workers.personnel_number = p_personnel_number;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/


-----------------------------------????????????????
--superkey12345678 - ключ шифрования (также RAW). Длина ключа должна соответствовать вы­бранному алгоритму. Например, для алгоритма DES она должна быть не менее 64 биn

create or replace procedure AddAccout(p_client_id Accounts.client_id%type, p_login Accounts.login%type, p_password_value Accounts.password_value%type)
is
  p_password_value_encrypted Accounts.password_value%type;
begin
    p_password_value_encrypted := encode(p_password_value, 'superkey12345678');

    insert into Accounts(client_id, login, password_value) 
    VALUES(p_client_id, p_login,p_password_value_encrypted);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/


create or replace procedure DeleteAccount(p_client_id Accounts.client_id%type)
is
begin
    delete from Accounts where Accounts.client_id = p_client_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/


create or replace procedure UpdateAccount(p_client_id Accounts.client_id%type, p_login Accounts.login%type, p_password_value Accounts.password_value%type)
is
begin
    update Accounts set client_id = p_client_id, login = p_login, password_value = p_password_value where Accounts.client_id = p_client_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/

select * from clients;






-----------------------------------------FUNCTIONS

---https://oracle-patches.com/db/sql/shifrovanie-i-deshifrovanie-v-pl-sql-dlya-bd-oracle-na-primere
--- done(
create or replace FUNCTION encode (p_in_val IN VARCHAR2, p_key IN VARCHAR2)
   RETURN VARCHAR2
IS
    l_mod NUMBER := DBMS_CRYPTO.encrypt_aes128
                  + DBMS_CRYPTO.chain_cbc
                  + DBMS_CRYPTO.pad_pkcs5;
    l_enc RAW (2000);
    BEGIN
       l_enc :=
          DBMS_CRYPTO.encrypt (utl_i18n.string_to_raw (p_in_val, 'AL32UTF8'),
                               l_mod,
                               utl_i18n.string_to_raw (p_key, 'AL32UTF8')
                              );
       return RAWTOHEX (l_enc);
END;

/

create or replace FUNCTION decode_val (p_in_val IN VARCHAR2, p_key IN VARCHAR2)
   RETURN VARCHAR2
IS
    l_mod      NUMBER :=   DBMS_CRYPTO.encrypt_aes128
                         + DBMS_CRYPTO.chain_cbc
                         + DBMS_CRYPTO.pad_pkcs5;
       l_dec      RAW (2000);
    BEGIN
       l_dec :=
          DBMS_CRYPTO.decrypt (HEXTORAW (p_in_val),
                               l_mod,
                              utl_i18n.string_to_raw (p_key, 'AL32UTF8')
                              );
      return utl_i18n.raw_to_char (l_dec);
    END;

/

---)


-- SYS_REFCURSOR нестрогой ссылки на курсор.
--Ссылка на курсор дает возможность не заводить структуры курсора (CURSOR … IS …) в клиентской программе, а ограничиться в ней выделением памяти только для адреса курсора,

create or replace procedure GetCurrentUser(p_login Accounts.login%type, p_password_value Accounts.password_value%type, cur out sys_refcursor)
is
 p_password_value_encrypted Accounts.password_value%type;
begin
p_password_value_encrypted := encode(p_password_value, 'superkey12345678');
open cur for select * from Accounts where login = p_login and password_value = p_password_value_encrypted;       
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/




select * from workers;
create or replace procedure GetCurrentWorker(p_personnel_number Workers.personnel_number%type, p_password_value Workers.password_value%type, cur out sys_refcursor)
is
begin
open cur for select * from Workers where personnel_number = p_personnel_number and password_value = p_password_value ; 

    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
COMMIT;

--declare curs sys_refcursor;
--begin
--kurs.GetCurrentWorker(1115,'PASSWORD15',curs);
--end;
--/




create or replace procedure GetCars(cur out sys_refcursor)
is
begin
open cur for select cars.id, cars.brand, cars.color, model.seats_number, Equipment.transmission, supplier.adress, cars.cost  from model join cars on  model.id = cars.model_id  join equipment on cars.equipment_id = equipment.id join supplier on cars.supplier_id =supplier.id   where   cars.sale_availability = 1;
        dbms_output.enable();
dbms_sql.return_result(cur);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/

------------------ND
create or replace procedure GetClients(cur out sys_refcursor)
is
begin
open cur for select accounts.login, accounts.client_id, clients.name, clients.surname, clients.age, clients.phone_number  from accounts join clients on  accounts.client_id = clients.id;
        dbms_output.enable();
dbms_sql.return_result(cur);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/

--declare curs sys_refcursor;
--begin
--kurs.GetCars(curs);
--end;


create or replace procedure GetCarsSearch( super_param cars.brand%type,cur out sys_refcursor)
is
begin
open cur for select  cars.id, cars.brand, cars.color, model.seats_number, Equipment.transmission, supplier.adress, cars.cost  from model join cars on  model.id = cars.model_id  join equipment on cars.equipment_id = equipment.id join supplier on cars.supplier_id = supplier.id  
where  cars.sale_availability = 1 and cars.brand = super_param or
  cars.sale_availability = 1 and cars.color = super_param or
  cars.sale_availability = 1 and TO_CHAR(model.seats_number) = super_param or
  cars.sale_availability = 1 and Equipment.transmission =super_param or
  cars.sale_availability = 1 and supplier.adress = super_param or
  cars.sale_availability = 1 and TO_CHAR(cars.cost) = super_param;
        dbms_output.enable();
dbms_sql.return_result(cur);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/




--declare curs sys_refcursor;
--begin
--kurs. GetCarsSearch('Ford',curs);
--end;



--- изменять наличие 
create or replace procedure SetCarSaleAvailability(p_car_id cars.id%type, p_sale_availability cars.sale_availability%type)
is
begin
    update cars set cars.sale_availability = p_sale_availability where cars.id = p_car_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/


--begin
--kurs.SetCarSaleAvailability(23,1);
--end;




create or replace trigger OrderCar
after insert on orders
for each row
begin
    SetCarSaleAvailability(:new.car_id, 0);
end;
/


--SELECT * FROM USER_PROCEDURES;
