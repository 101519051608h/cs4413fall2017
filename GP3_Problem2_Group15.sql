CREATE OR REPLACE PACKAGE assignment2_procedures
    AS
    PROCEDURE insert_customer("id" IN number, "name" IN varchar2, inplevel IN varchar2);
    PROCEDURE hike_translators;
    PROCEDURE print_data;
END assignment2_procedures;

CREATE OR REPLACE
PACKAGE BODY ASSIGNMENT2_PROCEDURES AS

  PROCEDURE insert_customer
        ("id" IN number,
         "name" IN varchar2,
        inplevel IN varchar2)
    AS
        CURSOR level_order IS 
            SELECT AVG(Cast (order_num as Float))
            FROM CUSTOMER
            WHERE "level" = inplevel;
        CURSOR general_order IS
            SELECT AVG(Cast (order_num as Float))
            FROM CUSTOMER;
        ordnum NUMBER;	
    BEGIN
        ordnum := 0;
        IF exists 
            (SELECT cid
            FROM CUSTOMER
            WHERE "level" = inplevel)
        THEN
            OPEN level_order;
            FETCH level_order into ordnum;
            CLOSE level_order;
        ELSE
            OPEN general_order;
            FETCH general_order into ordnum;
            CLOSE general_order;
        END IF;
        INSERT INTO Customer
        VALUES("id", "name", CEIL(ordnum), inplevel);
    END insert_customer;

  PROCEDURE hike_translators
    AS
    BEGIN
        UPDATE translator SET salary = CASE
                                        when tid in (SELECT tid
                                                    FROM         (SELECT Book.tid as tid, Book."btitle", Wrote."btitle"
                                                                 FROM Book, Wrote
                                                                 WHERE Book."btitle" = Wrote."btitle"))
                                        then salary * 1.1
                                        else
                                        when tid in (SELECT tid
                                                    FROM
                                                                (SELECT tid, Count("btitle") as tcount
                                                                FROM Book
                                                                GROUP BY tid
                                                                WHERE tcount >= 3))
    
                                        then salary * 1.05
                                        else
                                        salary * 1.02;
        commit;
    END hike_translators;

  PROCEDURE print_data
    AS
    BEGIN
        SELECT *
        FROM CUSTOMER;
        SELECT *
        FROM TRANSLATOR;
    END print_data;

END ASSIGNMENT2_PROCEDURES;
         
    /*
        ord_num :=
            see how many customers have the same level
            if 0: check average order num for all customers, rounded up
            if 1: check average order num for level customers, rounded up
        insert (id, name, ord_num, level) into customer 
    
        On java side, give three input boxes, which have their input directed to the query*/
        
    /*
        open 3 cursors associated with those who translated a book by a certain author, and those who translated 3+ books, and all translators
        give the first cursor a 10% pay increase
        give the second cursor minus the first cursor a 5% pay increase
        give the third cursor minus c1 + c2 a 2% pay increase 
    
        On java side, give one input box, input directed into query*/
    
    /* 
        copy-paste the selects from last project's 2.1 
        might need decent displaying which could be troublesome
        might be some method in jdbc to display elegantly
    */
    
    /*      just exit, yawn */ 
    