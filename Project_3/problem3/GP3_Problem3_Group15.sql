
/* FIRST MODULE */
create or replace PROCEDURE BOOK_INFO 
(
  BOOK_TITLE IN VARCHAR2, 
  INFO IN VARCHAR2
) 
AS
    author VARCHAR(20);
    translator VARCHAR(20);
    CURSOR author_cr is
        SELECT anmae 
        FROM AUTHOR 
        WHERE aid in (SELECT aid FROM WROTE WHERE "btitle" = BOOK_TITLE);
    CURSOR translator_cr is
        SELECT tname 
        FROM TRANSLATOR 
        WHERE tid in (SELECT tid FROM BOOK WHERE "btitle" = BOOK_TITLE);
BEGIN
    IF info = 'AUTHOR'
    THEN
        OPEN author_cr;
        
        LOOP
            FETCH author_cr INTO author;
            EXIT WHEN author_cr%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE(author || ' wrote ' || BOOK_TITLE);
        END LOOP;
        
        CLOSE author_cr;
    ELSIF info = 'TRANSLATOR'
    THEN
        OPEN translator_cr;
        FETCH translator_cr INTO translator;
        DBMS_OUTPUT.PUT_LINE(translator || ' translates ' || BOOK_TITLE);
        CLOSE translator_cr;
    ELSE 
        DBMS_OUTPUT.PUT_LINE(info || ' is not supported.');
    END IF;
END BOOK_INFO;

/* Using First Module */
SET SERVEROUTPUT ON;
DECLARE
    book_title VARCHAR2(20);     
    search_type VARCHAR2(20);
BEGIN
    book_title := 'Jurassic Park';
    search_type := 'TRANSLATOR';
    
    BOOK_INFO(book_title, search_type);
END;

/* Second Module */
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