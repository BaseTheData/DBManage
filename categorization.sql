/* ******************** Categorizations ********************** */
/* *********************WALKIN ECOMMERCE ******************** */
CREATE OR REPLACE TRIGGER categorization_walkin_customer
BEFORE INSERT OR UPDATE ON WalkIn
FOR EACH ROW
DECLARE
v_count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_count FROM (
SELECT Customer_id FROM Customer
WHERE Customer_id=:NEW.Customer_id
IF (v_count = 0) THEN
   RAISE_APPLICATION_ERROR(-20000, 'The new walkin ID_customer doesnt exists in Customer');
END IF;
END;
END;

CREATE OR REPLACE TRIGGER categorization_Ecommerce
BEFORE INSERT OR UPDATE ON ECommerce
FOR EACH ROW
DECLARE
v_count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_count FROM (
SELECT Customer_id FROM Customer
WHERE Customer_id=:NEW.Customer_id
IF (v_count = 0) THEN
   RAISE_APPLICATION_ERROR(-20000, 'The new walkin ID_customer doesnt exists in Customer');
END IF;
END;
END;

/* ************** Categorizations and disjoint ********** */
/* ******************* EMPLOYEE REGULAR ************** */
CREATE OR REPLACE TRIGGER categorization_employee_customer_disjoint_regular
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
DECLARE
isCust_count INTEGER;
isNotReg_count INTEGER;
BEGIN
SELECT COUNT(*) INTO isCust_count FROM (
SELECT customer_id FROM customer
WHERE customer_id=:NEW.customer_id );
SELECT COUNT(*) INTO isNotReg_count FROM (
SELECT customer_id FROM regular
WHERE customer_id=:NEW.customer_id );
IF ( isCust_count= 0 ) THEN
  RAISE_APPLICATION_ERROR(-20000, 'The new employee ID_customer doesnt exists in Customer');
END IF;
IF ( isNotReg_count> 0 ) THEN
  RAISE_APPLICATION_ERROR(-20000, 'The new employee ID_customer already exists in Regular');
END IF;
END;

CREATE OR REPLACE TRIGGER categorization_regular_customer_disjoint_employee
BEFORE INSERT OR UPDATE ON regular
FOR EACH ROW
DECLARE
isCust_count INTEGER;
isNotEmp_count INTEGER;
BEGIN
SELECT COUNT(*) INTO isCust_count FROM (
SELECT Customer_id FROM Customer
WHERE Customer_id=:NEW.Customer_id );
SELECT COUNT(*) INTO isNotReg_count FROM (
SELECT Customer_id FROM Employee
WHERE Customer_id=:NEW.Customer_id );
IF ( isCust_count= 0 ) THEN
  RAISE_APPLICATION_ERROR(-20000, 'The new employee ID_customer doesnt exists in Customer');
END IF;
IF ( isNotEmp_count> 0 ) THEN
  RAISE_APPLICATION_ERROR(-20000, 'The new employee ID_customer already exists in Regular');
END IF;
END;

/* ****************************** Categorization customer from ******************************** */
/* ******************************** PERSON COMPANY GOVERNMENT ********************************* */
CREATE OR REPLACE TRIGGER categorization_customer_person_government_company
BEFORE INSERT OR UPDATE ON Customer
FOR EACH ROW
DECLARE
v_count INTEGER;

BEGIN
SELECT COUNT(*) INTO v_count FROM (
SELECT Customer_id FROM Person
WHERE Customer_id=:NEW.Customer_id
UNION ALL
SELECT Customer_id FROM Company
WHERE Customer_id=:NEW.Customer_id
UNION ALL
SELECT Customer_id FROM Government
WHERE Customer_id=:NEW.Customer_id);

IF (v_count = 0) THEN
RAISE_APPLICATION_ERROR(-20000, 'ID must exist in either person, company or Government');
END IF;
END;
