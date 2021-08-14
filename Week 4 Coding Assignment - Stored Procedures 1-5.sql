-- Stored Procedure 1 --
DELIMITER //
CREATE PROCEDURE GetTitleCount(IN job_title varchar(200), OUT total_count INTEGER) 
BEGIN 
	SELECT count(*)
    INTO total_count
    FROM titles
    WHERE title = job_title;
END //
DELIMITER ;

CALL GetTitleCount('Staff', @total_count);
Select @total_count;

-- Stored Procedure 2 --
DELIMITER //
CREATE PROCEDURE CountByBirthDate(IN date varchar(30), OUT total INTEGER) 
BEGIN
	SELECT count(*) 
    INTO total
    FROM employees
    WHERE birth_date = date;

END //
DELIMITER ;

CALL CountByBirthDate('1964-11-02', @total);
Select @total;

-- Stored Procedure 3 --
DELIMITER //
CREATE PROCEDURE EmployeeIncome_Tester(IN employee_number INTEGER, OUT statement varchar(30), OUT pay INTEGER)
BEGIN 
	SELECT salary
    INTO Pay
    FROM salaries
    WHERE employee_number = emp_no AND to_date = '9999-01-01';
    
    IF pay < 50000 THEN
		SET statement = 'Low Income';
	ELSE 
		SET statement = 'High Income';
	END IF;

END //
DELIMITER ;

CALL EmployeeIncome_Tester(10004, @statement, @salary);
Select @statement;
Select @salary;

-- Stored Procedure 4 --
DELIMITER //
CREATE PROCEDURE ARETheyStillEmployed(IN id INTEGER, OUT result varchar(30))
BEGIN
	SELECT to_date
    INTO statement
    FROM titles
    WHERE emp_no = id;
    
    IF result = '9999-01-01' THEN
		SET result = 'Still Employeed';
	ELSE
		SET result = 'No Longer With The Company';
	END IF;
    
END //
DELIMITER ;

CALL AreTheyStillEmployed(10008, @result);
Select @result; 


-- Stored Procedure 5 --
DELIMITER //
CREATE PROCEDURE EmployeeCurrentPosition(IN firstname varchar(50), IN lastname varchar(50), OUT position varchar(50))
BEGIN
	SELECT title
    INTO position
    FROM employees e
    INNER JOIN titles t ON e.emp_no = t.emp_no
    WHERE first_name = firstname AND last_name = lastname AND to_date = '9999-01-01';
    
END //
DELIMITER ;

CALL EmployeeCurrentPosition('Georgi', 'Facello', @position);
SELECT @position;