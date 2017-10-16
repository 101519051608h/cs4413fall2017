create or replace PACKAGE assignment2_procedures
    AS
    PROCEDURE insert_customer("id" IN number, "name" IN varchar2, inplevel IN varchar2);
    PROCEDURE hike_translators(paramauthor in varchar2);
END assignment2_procedures;

create or replace PACKAGE BODY ASSIGNMENT2_PROCEDURES AS

  PROCEDURE insert_customer
        ("id" IN number,
         "name" IN varchar2,
        inplevel IN varchar2)
    AS
        /* Cursor to determine the existence of any customers with the same level */
        CURSOR level_ext IS
            SELECT cid
            FROM CUSTOMER
            WHERE "level" = inplevel;
        /* Cursor to find the avg amount of orders for customers of a given level */
        CURSOR level_order IS 
            SELECT AVG(Cast (number_of_orders as Float))
            FROM CUSTOMER
            WHERE "level" = inplevel;
        /* Cursor to find the avg amount of orders in general*/
        CURSOR general_order IS
            SELECT AVG(Cast (number_of_orders as Float))
            FROM CUSTOMER;
        /* Variable to hold order number*/
        ordnum NUMBER;
        /* Worthless variable to unload level_ext into */
        levelsthere NUMBER;
    BEGIN
        ordnum := 0;
        OPEN level_ext;
        FETCH level_ext into levelsthere;
        IF (level_ext%found)
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
    (paramauthor in VARCHAR2)
    AS
    /* Code was failing to compile without this even though it would seem to just be an alias so I brought it up here. */
    tcount NUMBER;
    BEGIN
        UPDATE translator SET salary = (CASE /*First off, if the translator translated a book by the given author. */
                                        when tid in (SELECT tid
                                                    FROM         (SELECT Book.tid as tid, Book."btitle", Wrote."btitle", Wrote.AID, Author.AID, Author.ANAME
                                                                 FROM Book, Wrote, Author
                                                                 WHERE Book."btitle" = Wrote."btitle" and Wrote.AID = Author.AID and Author.ANAME = paramauthor)
                                                    )
                                        then salary * 1.1
                                        else (CASE /*Then, if the translator translated 5+ books. */
                                            when tid in (SELECT tid
                                                        FROM
                                                                    (SELECT tid, Count("btitle") as tcount
                                                                    FROM Book
                                                                    WHERE tcount >= 3
                                                                    GROUP BY tid
                                                                    ))
        
                                            then salary * 1.05
                                            else /* finally, the default case. */
                                                salary * 1.02
                                            end) end);
    END hike_translators;

END ASSIGNMENT2_PROCEDURES;
