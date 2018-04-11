--TALLER DB ORACLE
--PUNTO 2 

CREATE TABLESPACE avianca DATAFILE 
'C:\TALLERDB\avianca.dbf' SIZE 2048M;

CREATE UNDO TABLESPACE test_undo DATAFILE
'C:\TALLERDB\test_undo.dbf' SIZE 25M;

/*PUNTO 3*/
ALTER SYSTEM SET UNDO_TABLESPACE = test_undo;

/*PUNTO 4*/
CREATE USER user1 IDENTIFIED BY AdminUser
DEFAULT TABLESPACE avianca 
QUOTA UNLIMITED ON avianca;
GRANT DBA TO user1;
GRANT CONNECT TO user1;

/*PUNTO 5A*/
CREATE PROFILE clerk LIMIT 
  SESSIONS_PER_USER                 1  
  IDLE_TIME                        10   
  FAILED_LOGIN_ATTEMPTS             4   
  PASSWORD_LIFE_TIME               40;  
  
  /*PUNTO 5B*/
CREATE PROFILE development LIMIT 
  SESSIONS_PER_USER                 2   
  IDLE_TIME                         30
  PASSWORD_LIFE_TIME               100;
  
  /*PUNTO 6*/
CREATE USER UserA
IDENTIFIED BY userA
DEFAULT TABLESPACE avianca
QUOTA UNLIMITED ON avianca
PROFILE clerk; 

CREATE USER UserB
IDENTIFIED BY userB
DEFAULT TABLESPACE avianca
QUOTA UNLIMITED ON avianca
PROFILE clerk;

CREATE USER UserC
IDENTIFIED BY userC
DEFAULT TABLESPACE avianca
QUOTA UNLIMITED ON avianca
PROFILE development;

CREATE USER UserD
IDENTIFIED BY userD
DEFAULT TABLESPACE avianca
QUOTA UNLIMITED ON avianca
PROFILE development;

GRANT CONNECT TO UserA;
GRANT CONNECT TO UserB;
GRANT CONNECT TO UserC;
GRANT CONNECT TO UserD;

/*PUNTO 7*/
ALTER USER UserA ACCOUNT LOCK;



