DROP TABLE employees; 
CREATE TABLE employees(
  department_id NUMBER(3)
);

INSERT INTO employees(department_id) VALUES(NULL);
INSERT INTO employees(department_id) VALUES(10);
INSERT INTO employees(department_id) VALUES(10);
INSERT INTO employees(department_id) VALUES(20);
INSERT INTO employees(department_id) VALUES(30);
INSERT INTO employees(department_id) VALUES(40);
INSERT INTO employees(department_id) VALUES(50);
INSERT INTO employees(department_id) VALUES(230);
COMMIT;

SELECT * FROM employees;
DEPARTMENT_ID
-------------
         null    
           10
           10
           20
           30
           40
           50
          230
          
-- 출력시 null 값은 제외됨.     
SELECT department_id FROM employees A WHERE A.department_id <= ALL(30);
DEPARTMENT_ID
-------------
           10
           10
           20
           30
           
SELECT department_id FROM employees A WHERE A.department_id <= ALL(50);
DEPARTMENT_ID
-------------
           10
           10
           20
           30
           40
           50

-- ALL = AND의 개념           
SELECT department_id FROM employees A WHERE A.department_id <= ALL(30, 50);
DEPARTMENT_ID
-------------
           10
           10
           20
           30

-- 중복 제거           
SELECT DISTINCT department_id FROM employees A WHERE A.department_id <= ALL(30, 50);
DEPARTMENT_ID
-------------
           30
           10
           20