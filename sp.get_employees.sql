--------------------------------------------------------
-- Archivo creado  - domingo-febrero-21-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure SP$GET_EMPLOYEES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."SP$GET_EMPLOYEES" (p_employeeid integer)
IS
  CURSOR cur_employees(p_employee_id INTEGER)
  IS
    SELECT * FROM employees WHERE employee_id=p_employee_id;
  r_employee cur_employees%rowtype;
BEGIN
  OPEN cur_employees(p_employeeid);
  LOOP
    FETCH cur_employees INTO r_employee;
    EXIT
  WHEN cur_employees%notfound;
    dbms_output.put_line(r_employee.last_name);
  END LOOP;
  CLOSE cur_employees;
END sp$get_employees;

/
