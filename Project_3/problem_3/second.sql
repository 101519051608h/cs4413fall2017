SET SERVEROUTPUT ON;
DECLARE
    b_title VARCHAR2(20);
    
    PROCEDURE purchases(book_title IN VARCHAR2)
    AS
        customer_name VARCHAR2(20);
        CURSOR customers_cr IS
        SELECT CNAME
        FROM CUSTOMER
        WHERE CID IN (SELECT cid FROM PURCHASED WHERE "btitle" = book_title);
    BEGIN
        OPEN customers_cr;
        LOOP
            FETCH customers_cr INTO customer_name;
            EXIT WHEN customers_cr%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE(customer_name || ' bought ' || book_title);
        END LOOP;
        CLOSE customers_cr;
    END;
BEGIN
    b_title := 'The Lion King';
    purchases(b_title);
END;