CREATE OR REPLACE DIRECTORY  DIR AS 'C:\XML_oracle';

create or replace procedure ImportEQUIPMENTFromXml
IS 
BEGIN 
INSERT INTO EQUIPMENT (TRANSMISSION, salon,stereo_system) 
SELECT ExtractValue(VALUE(EQUIPMENT), '//transmission') AS transmission, 
       ExtractValue(VALUE(EQUIPMENT), '//salon') AS salon ,
       ExtractValue(VALUE(EQUIPMENT), '//stereo_system') AS stereo_system 

FROM TABLE(XMLSequence(EXTRACT(XMLTYPE(bfilename('DIR', 'EQUIPMENT_import.xml'), 
           nls_charset_id('UTF-8')),'/ROWSET/ROW'))) EQUIPMENT; 
exception 
when others then 
raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM); 
end ImportEQUIPMENTFromXml; 



create or replace procedure exportXmlToEQUIPMENT
is  
rc sys_refcursor; 
doc DBMS_XMLDOM.DOMDocument; 
begin 
OPEN rc FOR  
SELECT TRANSMISSION, salon,stereo_system FROM EQUIPMENT; 
doc := DBMS_XMLDOM.NewDOMDocument(XMLTYPE(rc)); 
DBMS_XMLDOM.WRITETOFILE(doc, 'DIR/EQUIPMENT_export.xml'); 
commit; 
exception 
when others then 
raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);       
end exportXmlToEQUIPMENT;

begin
ImportEQUIPMENTFromXml();
end;


begin
exportXmlToEQUIPMENT();
end;


select * from equipment;